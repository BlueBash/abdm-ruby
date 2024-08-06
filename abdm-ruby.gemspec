# frozen_string_literal: true

require_relative "lib/abdm/version"

Gem::Specification.new do |spec|
  spec.name = "abdm-ruby"
  spec.version = Abdm::VERSION
  spec.authors = "Bikash Choudhury"
  spec.email = "bikash.choudhury@bluebash.co"

  spec.summary = %q{A Ruby wrapper for ABDM APIs}
  spec.description = %q{Provides an interface to interact with the ABDM APIs from Ruby applications}
  spec.homepage = "https://github.com/EHR-EMR-KIT/abdm-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EHR-EMR-KIT/abdm-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/EHR-EMR-KIT/abdm-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.files       = Dir['lib/**/*.rb', 'lib/generators/**/*']
  spec.require_paths = ["lib"]

  # Register a new dependency of your gem
  spec.add_dependency "httparty", "~> 0.22.0"
end
