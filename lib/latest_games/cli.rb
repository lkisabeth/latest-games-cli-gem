class LatestGames::CLI

  def call
    self.start
  end

  def list_platforms
    puts ""
    puts "******** Latest Video Games and Reviews ********"
    puts ""
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
      elsif input.to_i > 0
        puts "LIST OF [PLATFORM] GAMES HERE"
      end
    end
    puts ""
    puts "Hope you found something you like!"
    puts "Have a great day! :D"
  end

end
