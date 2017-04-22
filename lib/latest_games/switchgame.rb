class LatestGames::SwitchGame
  attr_accessor :name, :url, :summary, :release_date, :metascore, :publisher, :also_on

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_switch_games
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
    def self.scrape_switch_games
      doc = Nokogiri::HTML(open('http://www.metacritic.com/browse/games/release-date/new-releases/switch', 'User-Agent'=>'chrome'))
      names = doc.search("div[class='basic_stat product_title'] a")
      names.collect{|title| new(title.text.strip, "http://www.metacritic.com#{title.attr("href")}")}
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
