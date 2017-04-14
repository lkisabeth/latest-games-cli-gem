class LatestGames::CLI

  def call
    puts ""
    puts "******** Latest Video Games and Reviews ********"
    puts ""
    self.start
  end

  def list_platforms
    puts "******===> Select a gaming platform: <===*******"
    puts ""
    puts "1) PS4"
    puts "2) Xbox One"
    puts "3) Switch"
    puts "4) PC"
    puts "5) iOS"
  end

  def start
    self.list_platforms
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the corresponding number to select a platform:"
      input = gets.strip
      if input.to_i == 0 && input != "exit"
        puts ""
        puts "Please enter the number, not the platform name!"
        puts "Restarting..."
        sleep(2)
        start
      elsif input.to_i == 1
        platform = LatestGames::PS4Game.new
        list_games(platform)
      end
    end
    puts ""
    puts "Hope you found something you like!"
    puts "Have a great day! :D"
  end

  def list_games(platform)
    puts ""
    if platform.is_a? LatestGames::PS4Game
      puts "*************** Latest PS4 Games ***************"
    elsif platform.is_a? LatestGames::IOSGame.new
      puts "*************** Latest iOS Games ***************"
    elsif platform.is_a? LatestGames::XboneGame.new
      puts "************* Latest Xbox One Games ************"
    elsif platform.is_a? LatestGames::PCGame.new
      puts "*************** Latest PC Games ****************"
    elsif platform.is_a? LatestGames::SwitchGame.new
      puts "************* Latest Switch Games **************"
    end
    puts ""
    #@platform.all.each.with_index(1) {|game, i|
      #puts "#{i}) #{game.name}  #{game.metascore}"
    #}
    puts ""
  end

end
