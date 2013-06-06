# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'music_player/version'

Gem::Specification.new do |spec|
  spec.name          = "music_player"
  spec.version       = MusicPlayer::VERSION
  spec.authors       = ["Chris"]
  spec.email         = ["github@hell-labs.org"]
  spec.description   = "A music player"
  spec.summary       = "A music player for all"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
