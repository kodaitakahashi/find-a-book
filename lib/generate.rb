#/usr/local/env ruby
#coding:utf-8

=begin
The MIT License (MIT)

Copyright (c) 2015 Kodai Takahashi.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
=end

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
