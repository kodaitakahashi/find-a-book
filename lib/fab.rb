#!/usr/local/env ruby
#coding:utf-8
require "fab/version"
require "apikey"
require "json"
require "open-uri"
require "uri"

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
      @send_param << "&format=json"
    end

    def get_id()
      encode_uri = URI.encode(@send_param)
      get_json = open(encode_uri).read
      get_json.gsub!("callback([","")
      get_json.gsub!("]);","")
      result = JSON.load(get_json)
      p result
#      @library_list |= Array.new
      
    end
  end
end
