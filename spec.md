# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
  - lib/latest_games/cli.rb contains all of the code for the CLI portion of the program.  
- [x] Pull data from an external source
  - scrapes data from metacritic.com.  Each of the (platform)game.rb files contain a private scrape method with a URL to retrieve a list of the latest games for each platform
- [x] Implement both list and detail views
  - the program opens with a list view of gaming platforms to choose from, then a list view of the platform-specific games, and then each game can be selected for a detail view
