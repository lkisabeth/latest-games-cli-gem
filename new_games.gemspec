# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'new_games/version'

Gem::Specification.new do |spec|
  spec.name          = "new_games"
  spec.version       = NewGames::VERSION
  spec.authors       = ["'Lucas Kisabeth'"]
  spec.email         = ["'lukey.mac@outlook.com'"]

  spec.summary       = "Latest Video Games and Reviews"
  spec.description   = "Provides lists of the latest video games and reviews from Metacritic.com and sorts them by platform."
  spec.files         = ["lib/new_games.rb", "lib/new_games/cli.rb", "lib/new_games/iosgame.rb", "lib/new_games/pcgame.rb", "lib/new_games/ps4game.rb", "lib/new_games/switchgame.rb", "lib/new_games/xbonegame.rb", "config/environment.rb"]
  spec.homepage      = "https://github.com/lukeymac/new-games-cli-gem"
  spec.license       = "MIT"
  spec.executables   << 'new-games'

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
