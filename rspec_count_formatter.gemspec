
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'rspec_count_formatter'
  spec.version       = '0.1.2'
  spec.authors       = ['Mikko Kokkonen']
  spec.email         = ['mikko@mikian.com']

  spec.summary       = 'Display simple count of progress'
  spec.description   = %q{
    Designed for CI systems which only outputs row-by-row, this formatter displays current progress in CI friendly way.
  }
  spec.homepage      = 'https://github.com/mikian/rspec_count_formatter'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec-core'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
