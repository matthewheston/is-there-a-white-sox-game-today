require 'sinatra'
require 'icalendar'

configure do
  cal_file = File.open("res/schedule.ics")
  cal = Icalendar.parse(cal_file).first
  @@games = cal.events.find_all { |e| e.dtstart > DateTime.now }
end

get '/' do
  if game_today?
      "There is a game today."
    else
      "There is not a game today"
    end
end

def game_today?
  @@games.find do |game|
    game.dtstart.new_offset(DateTime.now.offset).year == DateTime.now.year and
    game.dtstart.new_offset(DateTime.now.offset).month == DateTime.now.month and
    game.dtstart.new_offset(DateTime.now.offset).day == DateTime.now.day
  end
end
