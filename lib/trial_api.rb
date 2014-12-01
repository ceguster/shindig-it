require 'open-uri'
require 'json'
require 'pry'

  def trial
    html = open("http://api.yummly.com/v1/api/recipes?_app_id=9e85e290&_app_key=38ad5aafd37cdfd1af59bdb8ecba4e7e&q=onion+soup").read()
    hsh = JSON.parse(html)
    binding.pry
  end

  puts trial