class LatestGames::XboneGame
  attr_accessor :name, :url, :release_date, :metascore, :publisher, :also_on

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_xbone_games
  end

end
