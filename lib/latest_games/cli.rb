class LatestGames::CLI

  def call
    puts ""
    puts "******** Latest Video Games and Reviews ********"
    puts ""
    self.start
  end

  def list_platforms
    puts "------> Select a gaming platform: <------"
    puts "1. PS4"
    puts "2. Xbox One"
    puts "3. Switch"
    puts "4. PC"
    puts "5. iOS"
    puts "-----------------------------------------"
    puts "(To quit, enter 'exit' at any time..)".color(:red)
  end

  def start
    self.list_platforms
    input = nil
    until input == "exit"
      input = nil
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
    end_program
  end

  def list_games(platform)
    input = nil
    puts ""
    until input == "exit"
      if platform.is_a? LatestGames::PS4Game
        puts "*************** Latest PS4 Games ***************"
        puts ""
        wait_cursor(1)
        LatestGames::PS4Game.all[0..9].each.with_index(1) {|game, i|
          puts "#{i}. #{game.name}"
        }
        puts ""
        puts "Select a game to get more info:"
        input = gets.strip
        game = LatestGames::PS4Game.find(input.to_i)
        if input != "exit"
          select_game(game, "PS4")
        elsif input == "exit"
          end_program
        end

      elsif platform.is_a? LatestGames::IOSGame
        puts "*************** Latest iOS Games ***************"
        puts ""
        wait_cursor(1)
        LatestGames::IOSGame.all[0..9].each.with_index(1) {|game, i|
            puts "#{i}. #{game.name}"
        }
        puts ""
        puts "Select a game to get more info:"
        input = gets.strip
        game = LatestGames::IOSGame.find(input.to_i)
        if input != "exit"
          select_game(game, "iOS")
        elsif input == "exit"
          end_program
        end

      elsif platform.is_a? LatestGames::XboneGame
        puts "************* Latest Xbox One Games ************"
        puts ""
        wait_cursor(1)
        LatestGames::XboneGame.all[0..9].each.with_index(1) {|game, i|
          puts "#{i}. #{game.name}"
        }
        puts ""
        puts "Select a game to get more info:"
        input = gets.strip
        game = LatestGames::XboneGame.find(input.to_i)
        if input != "exit"
          select_game(game, "Xbox One")
        elsif input == "exit"
          end_program
        end

      elsif platform.is_a? LatestGames::PCGame
        puts "*************** Latest PC Games ****************"
        puts ""
        wait_cursor(1)
        LatestGames::PCGame.all[0..9].each.with_index(1) {|game, i|
          puts "#{i}. #{game.name}"
        }
        puts ""
        puts "Select a game to get more info:"
        input = gets.strip
        game = LatestGames::PCGame.find(input.to_i)
        if input != "exit"
          select_game(game, "PC")
        elsif input == "exit"
          end_program
        end

      elsif platform.is_a? LatestGames::SwitchGame
        puts "************* Latest Switch Games **************"
        puts ""
        wait_cursor(1)
        LatestGames::SwitchGame.all[0..9].each.with_index(1) {|game, i|
          puts "#{i}. #{game.name}"
        }
        puts ""
        puts "Select a game to get more info:"
        input = gets.strip
        game = LatestGames::SwitchGame.find(input.to_i)
        if input != "exit"
          select_game(game, "Switch")
        elsif input == "exit"
          end_program
        end

      end
    end
    end_program
  end

  def select_game(game, platformname)
    puts ""
    puts "------- #{game.name} - #{platformname} -------"
    puts ""
    puts "Publisher: #{game.publisher}"
    puts "Release Date: #{game.release_date}"
    if game.also_on == ""
      puts "Only on #{platformname}"
    else
      puts "Also On: #{game.also_on}"
    end
    puts ""
    if game.metascore.to_i == 0
      puts "Metascore: TBD"
    elsif game.metascore.to_i >= 75
      puts "Metascore: #{game.metascore.color(:green)}"
    elsif game.metascore.to_i < 75 && game.metascore.to_i >= 50
      puts "Metascore: #{game.metascore.color(:yellow)}"
    elsif game.metascore.to_i < 50
      puts "Metascore: #{game.metascore.color(:red)}"
    end
    puts ""
    if game.summary == ""
      puts "No Summary Provided"
    else
      puts "Summary: #{game.summary[0...500]}.."
    end
    puts ""
    puts "--------------------"
    puts ""
    puts "Would you like to check out another #{platformname} game? (y/n)"
    input = gets.strip
    if input.downcase == "n" || input.downcase == "no"
      self.start
    elsif input.downcase == "exit"
      end_program
    end
  end

  def wait_cursor(seconds,fps=10)
    chars = %w[| / - \\]
    delay = 1.0/fps
    (seconds*fps).round.times{ |i|
      print "Loading.. " + chars[i % chars.length]
      sleep delay
      print "\b\b\b\b\b\b\b\b\b\b\b"
    }
  end

  def end_program
    puts ""
    puts "------------"
    puts "Hope you found something you like!"
    puts "Have a great day! :D"
    exit
  end

end
