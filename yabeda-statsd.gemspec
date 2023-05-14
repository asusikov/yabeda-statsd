# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yabeda/statsd/version"

Gem::Specification.new do |spec|
  spec.name          = "yabeda-statsd"
  spec.version       = Yabeda::Statsd::VERSION
  spec.authors       = ["Alexander Susikov <@asusikov>"]
  spec.email         = ["susikov.alexander@gmail.com"]

  spec.summary       = "Statsd adapter for reporting metrics from Yabeda suite"
  spec.description = <<~DESCRIPTION
    Adapter for reporting custom metrics from Yabeda to Statsd server.
  DESCRIPTION
  spec.homepage      = "https://github.com/asusikov/yabeda-statsd"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dogstatsd-ruby"
  spec.add_dependency "dry-configurable"
  spec.add_dependency "yabeda"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
