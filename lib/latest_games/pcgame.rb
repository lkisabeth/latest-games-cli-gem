class LatestGames::PCGame
  attr_accessor :name, :url, :summary, :release_date, :metascore, :publisher, :also_on

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_pc_games
  end

  def self.find(i)
    self.all[i-1]
  end

  def self.find_by_name(name)
    self.all.detect do |game|
      game.name.downcase.strip == name.downcase.strip ||
      game.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def summary

  end

  def release_date

  end

  def metascore

  end

  def publisher

  end

  def also_on

  end

  private
    def self.scrape_pc_games

    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
