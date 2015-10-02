#/usr/local/env ruby
#coding:utf-8

module Fab
  class Api

    ERROR_MASSEGE = <<-EOS
That already exists
Please , $fab {-r , --remake} {-a , --apikey} [APIKey]
EOS
    def create_apifile(apikey)
      if file_empty?
        write_file(path(),apikey)
        true
      else
        puts ERROR_MASSEGE
        false
      end
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
      File.open(path(),"w") do | file |
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

    def file_empty?()
      File.open(path(), "r") do | file |
        if file.read == ""
          true
        else
          false
        end
      end
    end
    
  end
end
