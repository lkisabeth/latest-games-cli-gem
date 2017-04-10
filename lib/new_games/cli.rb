class NewGames::CLI

  def call
    start
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
    list_platforms
  end

end
