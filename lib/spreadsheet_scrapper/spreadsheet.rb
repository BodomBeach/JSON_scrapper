

require 'pry'

class Spreadsheet

  def initialize(hash)
    @session = GoogleDrive::Session.from_config("config.json")
    @ws = @session.spreadsheet_by_key("1qGoGDHpMjTnCU0QVZmX6wqI3ErmMucRzaZmDmoyv4sg").worksheets[0]
    @hash = hash
  end

  def feed_spreadsheet
    i = 3
    @hash.each do |city, email|
      @ws[i, 3] = city
      @ws[i, 3 - 1] = email
      i += 1
    end
    @ws.save
  end

  def perform
    feed_spreadsheet
  end
end
