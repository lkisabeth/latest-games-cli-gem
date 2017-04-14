# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'new_games/version'

Gem::Specification.new do |spec|
  spec.name          = "new_games"
  spec.version       = NewGames::VERSION
  spec.authors       = ["'Lucas Kisabeth'"]
  spec.email         = ["'lukey.mac@outlook.com'"]

  spec.summary       = %q{Welcome to the "New Games" cli gem! This program will scrape metacritic.com to provide you with a small database of the latest video games.  The content can be sorted by gaming platform (PS4, Xbox One, PC, etc.) and can display info such as metacritic review, description, release date, and genre. This gem will IGNORE games that do not yet have a metacritic review score posted!}
  spec.homepage      = "https://github.com/lukeymac/new-games-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
