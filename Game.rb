module Game

  def self.set_games(games)
    @@games = games
  end

  def self.today
    @@games.find do |game|
      game.dtstart.new_offset(DateTime.now.offset).year == DateTime.now.year and
      game.dtstart.new_offset(DateTime.now.offset).month == DateTime.now.month and
      game.dtstart.new_offset(DateTime.now.offset).day == DateTime.now.day
    end
  end

end
