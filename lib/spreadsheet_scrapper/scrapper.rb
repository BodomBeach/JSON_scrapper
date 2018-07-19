require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'



class Scrapper

  def initialize
    @PAGE_URL= "http://annuaire-des-mairies.com/val-d-oise.html"
    @root = "http://annuaire-des-mairies.com"
  end

    def get_the_email_of_a_townhal_from_its_webpage(url)
    doc = Nokogiri::HTML(open(url))
    doc.xpath('html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    end

    def get_all_the_urls_of_val_doise_townhalls
    info = []
    arr = []
    doc = Nokogiri::HTML(open(@PAGE_URL))
    doc.xpath('//td/p/a/@href').each do |node|
      h = {}
      # binding.pry
      temp = node.text.sub(/^[.]/, @root)

      h["email"] = get_the_email_of_a_townhal_from_its_webpage(temp)
      info << h
    end

    doc.xpath('//td/p/a').each do |node|
      arr << node.text
    end

    n = 0
    info.each do |town|
      town["name"] = arr[n]
      n += 1
    end
    info.reverse
    end

    def perform
      get_all_the_urls_of_val_doise_townhalls
    end
end
