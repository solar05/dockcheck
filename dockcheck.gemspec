Gem::Specification.new do |s|
  s.name        = 'dockcheck'
  s.version     = '2.0.3'
  s.summary     = "Document checksum validator."
  s.description = "A simple document checksum validator"
  s.authors     = ["Artem Solomatin"]
  s.email       = 'solar7455@gmail.com'
  s.files       = ["lib/dockcheck.rb",
                   "lib/dockcheck/inn.rb",
                   "lib/dockcheck/snils.rb",
                   "lib/dockcheck/bik.rb",
                   "lib/dockcheck/kpp.rb",
                   "lib/dockcheck/ogrnip.rb",
                   "lib/dockcheck/ogrn.rb",
                   "lib/dockcheck/dockhelper.rb"
                  ]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0")
  s.add_development_dependency "rspec"
  s.homepage    =
    'https://rubygems.org/gems/dockcheck'
  s.license       = 'MIT'
end
