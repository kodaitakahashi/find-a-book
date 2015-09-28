#!/usr/local/env ruby
#coding:utf-8
require "apikey"
require "json"
require "open-uri"
require "uri"
require 'active_support/all'

module Fab

  class Find

    def initialize
      @book_send_param = "http://api.calil.jp/check?"
    end

    def book_set_param(isbn)
      @book_send_param << "appkey=#{Fab::Apikey::APIKEY}"
      @book_send_param << "&isbn=#{isbn}"
    end
  end
  
  class Set < Find
    def initialize()
      @library_send_param = "http://api.calil.jp/library?appkey=#{Fab::Apikey::APIKEY}"
    end
    
    def library_set_param(pref,city)
      @library_send_param << "&pref=#{pref}"
      @library_send_param << "&city=#{city}"
    end

    def get_params()
      encode_uri = URI.encode(@library_send_param)
      get_xml = open(encode_uri).read
      convert_json = Hash.from_xml(get_xml).to_json
      result = JSON.load(convert_json)
      @libraries = Hash.new { | h , k | h[k] = {} }
      for i in 0..count_id(result)
        @libraries[i]["libid"] =  result["Libraries"]["Library"][i]["libid"]
        @libraries[i]["formal"] = result["Libraries"]["Library"][i]["formal"]
      end
    end
    
    private
    def count_id(target)
      id_count = target.to_s.scan(/l[a-z]*d/).size - 1 
      id_count
    end
  end
end
