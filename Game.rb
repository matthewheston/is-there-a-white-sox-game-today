module Game

  def self.set_games(games)
    @@games = games
  end

  def self.today
    @@games.find do |game|
      central_game = game.dtstart.in_time_zone('Central Time (US & Canada)')
      central_now = DateTime.now.in_time_zone('Central Time (US & Canada)')
      central_game.year == central_now.year and
      central_game.month == central_now.month and
      central_game.day == central_now.day
    end
  end

end
