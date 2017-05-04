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
    @summary ||= doc.xpath("//*[@id='main']/div/div[3]/div/div[2]/div[2]/div[1]/ul/li/span[2]/span").text.strip
  end

  def release_date
    @release_date ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[2]/span[2]").text.strip
  end

  def metascore
    @metascore ||= doc.xpath("//*[@id='main']/div/div[3]/div/div[2]/div[1]/div[1]/div/div/a/div/span").text.strip
  end

  def publisher
    @publisher ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[1]/span[2]/a/span").text.strip
  end

  def also_on
    @also_on ||= doc.xpath("//*[@id='main']/div/div[1]/div[2]/ul/li[3]/span[2]").text.strip
  end

  private
    def self.scrape_switch_games
      doc = Nokogiri::HTML(open('http://www.metacritic.com/browse/games/release-date/new-releases/switch', 'User-Agent'=>'chrome'))
      names = doc.search("div[class='basic_stat product_title'] a")
      names.collect{|title| new(title.text.strip, "http://www.metacritic.com#{title.attr("href")}")}
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url, 'User-Agent'=>'chrome'))
    end

end
