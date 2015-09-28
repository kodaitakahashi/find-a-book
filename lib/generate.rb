#/usr/local/env ruby
#coding:utf-8

module Fab
  class Api

    def create_apifile(apikey)
      api_path = File.expand_path('../../lib',__FILE__)
      api_path << "/apikey.rb"
      write_file(api_path,apikey)
    end

    def permute_apifile(apikey)
      api_path = File.expand_path('../../lib',__FILE__)
      api_path << "/apikey.rb"
      File.open(api_path , "w") do | file |
        file = nil
      end
      write_file(api_path,apikey)
    end

    private
    def write_file(path,apikey)
      File.open(path,"w") do | file |
        file.puts(<<"EOS")
#!/usr/local/env ruby
#codinf:utf-8

module Fab
  class Apikey
     APIKEY = \"#{apikey}\"
  end
end
EOS
      end
    end
  end
end
