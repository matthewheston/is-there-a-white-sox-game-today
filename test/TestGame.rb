require 'icalendar'
require 'test/unit'
require 'mocha'
require_relative '../Game.rb'

class TestGame < Test::Unit::TestCase

  def test_game_today_allutc
    game1 = Icalendar::Event.new
    game1.dtstart = DateTime.new(2012,5,15,12,0,0,'0')
    game2 = Icalendar::Event.new
    game2.dtstart = DateTime.new(2012,5,16,12,0,0,'0')
    game3 = Icalendar::Event.new
    game3.dtstart = DateTime.new(2012,5,17,12,0,0,'0')

    DateTime.stubs(:now).returns(DateTime.new(2012,5,17,15,15,0,'0'))

    Game.set_games([game1, game2, game3])

    assert Game.today?
  end

  def test_game_today_nowiscentral
    game1 = Icalendar::Event.new
    game1.dtstart = DateTime.new(2012,5,15,12,0,0,'0')
    game2 = Icalendar::Event.new
    game2.dtstart = DateTime.new(2012,5,16,12,0,0,'0')
    game3 = Icalendar::Event.new
    game3.dtstart = DateTime.new(2012,5,18,3,0,0,'0')

    DateTime.stubs(:now).returns(DateTime.new(2012,5,17,15,15,0,'-5'))

    Game.set_games([game1, game2, game3])

    assert Game.today?
  end

  def test_no_game_today_nowiscentral
    game1 = Icalendar::Event.new
    game1.dtstart = DateTime.new(2012,5,15,12,0,0,'0')
    game2 = Icalendar::Event.new
    game2.dtstart = DateTime.new(2012,5,16,12,0,0,'0')
    game3 = Icalendar::Event.new
    game3.dtstart = DateTime.new(2012,5,17,12,0,0,'0')

    DateTime.stubs(:now).returns(DateTime.new(2012,5,18,19,20,0,'-5'))

    Game.set_games([game1, game2, game3])

    assert !Game.today?
  end
end
