require 'bundler'

require_relative 'lib/spreadsheet_scrapper/scrapper.rb'
require_relative 'lib/spreadsheet_scrapper/convert.rb'
require_relative 'lib/spreadsheet_scrapper/spreadsheet.rb'


arr = Scrapper.new.perform
Convert.new(arr).perform_json
hash = Convert.new(arr).perform_hash
Spreadsheet.new(hash).perform
