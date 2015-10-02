#/usr/local/env ruby
#coding:utf-8

module Fab
  class Api

    def create_apifile(apikey)
      delete()
      write_file(path(),apikey)
      true
    end

    def remake_apifile(apikey)
      delete()
      write_file(path(),apikey)
      true
    end

    def delete()
      path()
      File.open(path() , "w") do | file |
        file = nil
      end
    end
    
    private
    def path()
      api_path = File.expand_path('../../lib',__FILE__)
      api_path << "/apikey.rb"
      api_path
    end
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
