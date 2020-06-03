# (c) Copyright 2020 Ribose Inc.
#

require_relative "lib/geolexica-site/version.rb"

all_files_in_git = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

ribose_url = "https://open.ribose.com/"
github_url = "https://github.com/geolexica/geolexica-site"

Gem::Specification.new do |spec|
  spec.name          = "geolexica-site"
  spec.version       = GeolexicaSite::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Geolexica sites generator based on Jekyll"
  spec.homepage      = ribose_url
  spec.license       = "MIT"

  spec.metadata      = {
    "homepage_uri"      => ribose_url,
    "source_code_uri"   => github_url,
  }

  spec.files         = all_files_in_git

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  # Major dependencies.
  spec.add_runtime_dependency "jekyll", "~> 4.0.1"
  spec.add_runtime_dependency "jekyll-geolexica", "~> 1.1.0"

  # Most useful Jekyll plugins.
  spec.add_runtime_dependency "jekyll-asciidoc", "~> 3.0.0"
  spec.add_runtime_dependency "jekyll-tidy-json", "~> 1.2.0"
  spec.add_runtime_dependency "jekyll-plugin-frontend-build", "~> 0.0.3"
  spec.add_runtime_dependency "jekyll-theme-isotc211-helpers", "~> 0.6.0"

  # These are less important gems.  Freezing them is probably a good idea.
  spec.add_runtime_dependency "jekyll-data", "= 1.1.0"
  spec.add_runtime_dependency "jekyll-feed", "= 0.13"
  spec.add_runtime_dependency "jekyll-sitemap", "= 1.4.0"

  # These gems are indirectly but widely used throughout the project,
  # therefore adding some version constraints is a good idea.
  spec.add_runtime_dependency "liquid", "~> 4.0.3"
  spec.add_runtime_dependency "asciidoctor", "~> 2.0"

  # Helpful on Windows
  spec.add_runtime_dependency "tzinfo", "~> 2.0"
  spec.add_runtime_dependency "wdm", "> 0"

  # Useful in development.
  spec.add_runtime_dependency "pry", "~> 0.13.1"
  spec.add_runtime_dependency "pry-doc", "~> 1.1.0"
end
