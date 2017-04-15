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
    puts ""
    puts "(To quit, enter 'exit' at any time..)"
  end

  def start
    self.list_platforms
    input = nil
    until input == "exit"
      puts ""
      puts "Select a platform:"
      input = gets.strip
      if input.to_i == 1 || input.downcase == "ps4"
        platform = LatestGames::PS4Game.new
        list_games(platform)
      elsif input.to_i == 2 || input.downcase == "xbox one"
        platform = LatestGames::XboneGame.new
        list_games(platform)
      elsif input.to_i == 3 || input.downcase == "switch"
        platform = LatestGames::SwitchGame.new
        list_games(platform)
      elsif input.to_i == 4 || input.downcase == "pc"
        platform = LatestGames::PCGame.new
        list_games(platform)
      elsif input.to_i == 5 || input.downcase == "ios"
        platform = LatestGames::IOSGame.new
        list_games(platform)
      elsif input.to_i == 0 && input != "exit"
        puts ""
        puts "That didn't quite work.. check your spelling and try again!"
        puts "Reprinting list..."
        sleep(2)
        start
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
    elsif platform.is_a? LatestGames::IOSGame
      puts "*************** Latest iOS Games ***************"
    elsif platform.is_a? LatestGames::XboneGame
      puts "************* Latest Xbox One Games ************"
    elsif platform.is_a? LatestGames::PCGame
      puts "*************** Latest PC Games ****************"
    elsif platform.is_a? LatestGames::SwitchGame
      puts "************* Latest Switch Games **************"
    end
    puts ""
    #platform.all.each.with_index(1) {|game, i|
      #puts "#{i}) #{game.name}  #{game.metascore}"
    #}
    puts ""
  end

end
