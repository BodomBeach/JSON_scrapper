require 'google_drive'
require 'json'



class Convert

  def initialize(arr)
    @arr = arr
  end

  def convert_to_hash(arr)
    h = {}
    i = 0
    arr.each do |hash|
      h[hash[hash.keys[0]]] = hash[hash.keys[1]]
    end
    h
  end

  def convert_to_json(hash)
    File.open("/home/nico/THP/JSON_scrapper/db/emails.JSON","w") do |f|
      f.write(hash.to_json)
    end
  end

  def perform_hash
    convert_to_hash(@arr)
  end

  def perform_json
    convert_to_json(convert_to_hash(@arr))
  end
end
