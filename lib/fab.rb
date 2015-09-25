#!/usr/local/env ruby
#coding:utf-8
require "fab/version"
require "apikey"
require "json"
require "open-uri"
require "uri"
require 'active_support/all'

module Fab

  class Find

  end
  
  class Set < Find
    def initialize()
      @send_param = "http://api.calil.jp/library?appkey=#{Fab::Apikey::APIKEY}"
    end
    
    def set_param(pref,city)
      @send_param << "&pref=#{pref}"
      @send_param << "&city=#{city}"
    end

    def get_params()
      encode_uri = URI.encode(@send_param)
      get_xml = open(encode_uri).read
      convert_json = Hash.from_xml(get_xml).to_json
      result = JSON.load(convert_json)
      @libraries = Hash.new { | h , k | h[k] = {} }
      for i in 0..count_id(result)
        @libraries[i]["libid"] =  result["Libraries"]["Library"][i.to_i]["libid"]
        @libraries[i]["formal"] = result["Libraries"]["Library"][i.to_i]["formal"]
      end
    end
    
    private
    def count_id(target)
      count = target.to_s.scan(/l[a-z]*d/).size - 1 
      count
    end
  end
end
