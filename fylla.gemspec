lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fylla/version"

Gem::Specification.new do |spec|
  spec.name = "fylla"
  spec.version = Fylla::VERSION
  spec.authors = ["Tyler Thrailkill"]
  spec.email = ["tyler.b.thrailkill@gmail.com"]

  spec.summary = "Adds functions for generating autocomplete scripts for Thor applications"
  spec.description = "Fylla generates zsh and bash autocomplete scripts for Thor CLI applications."
  spec.homepage = "https://github.com/snowe2010/fylla"
  spec.license = "MIT"

  spec.metadata["yard.run"] = "yri" # use "yard" to build full HTML docs.
  spec.metadata["changelog_uri"] = "https://github.com/snowe2010/fylla/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(.idea|test|spec|features)/|^[.][a-zA-Z0-9]|^.*[.]md|Gemfile.lock})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "codecov", "~> 0.1.14"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-hooks", "~> 1.5.0"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "rubocop-minitest", "~> 0.27.0"
  spec.add_development_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_dependency "thor", ">= 0.19.0"
end
