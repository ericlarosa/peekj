lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "peekj/version"

Gem::Specification.new do |spec|
  spec.name          = "peekj"
  spec.version       = Peekj::VERSION
  spec.authors       = ["Eric La Rosa"]
  spec.email         = ["eric@rosa.la"]

  spec.summary       = 'Integrate with jira and fetch issues info'
  spec.description   = 'Integrate with jira and fetch issues info.'
  spec.homepage      = 'https://github.com/ericlarosa/peekj'
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_runtime_dependency "http"
  spec.add_runtime_dependency "thor"
end
