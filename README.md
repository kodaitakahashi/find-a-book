# Fab

Japan only.
Your looking book.
This command is easy Your looking book.

## Installation


```
ruby
gem 'fab'
or
gem 'fab', github:"hogehoge"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fab

## Usage
Get APIKey in Kariru
[カーリル](https://calil.jp/"calil")

    $fab registratin { -a , --apikey} [Your APIkey]
APIkey add to apikey.rb
[option]
{-a , --apikey} add apikey.rb
{-r , --remake} remake apikey.rb

    $fab find {-i , --isbn} {-p , --pref} {-c , --city}
search your  looking book
[option]
{-i , --isbn} Your looking book isbn.
{-p , --pref} Search for prefectures.
{-c , --city} Serarch for city.

    $fab delete 
delete apikey.rb
