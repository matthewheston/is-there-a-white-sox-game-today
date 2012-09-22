require 'sinatra'
require 'icalendar'
require 'ri_cal'
require './Game.rb'

configure do
  cal_file = File.read("res/schedule.ics")
  cal = RiCal.parse_string(cal_file).first
  Game.set_games( cal.events.find_all { |e| e.dtstart > DateTime.now })
end

get '/' do
  @today = Game.today
  erb :index
end

get '/about' do
  send_file File.join(settings.public_folder, 'about.html')
end
