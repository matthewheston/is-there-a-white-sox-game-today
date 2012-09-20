require 'sinatra'
require 'icalendar'
require './Game.rb'

configure do
  cal_file = File.open("res/schedule.ics")
  cal = Icalendar.parse(cal_file).first
  Game.set_games( cal.events.find_all { |e| e.dtstart > DateTime.now })
end

get '/' do
  @today = Game.today
  erb :index
end
