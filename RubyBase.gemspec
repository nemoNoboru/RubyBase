Gem::Specification.new do |s|
  s.name        = "ruby_base"
  s.version     = "1.0.5"
  s.authors     = ["Felipe Vieira"]
  s.email       = ["felipetavres@gmail.com"]
  s.homepage    = "https://github.com/nemoNoboru/RubyBase"
  s.summary     = "JSON API engine to be used as a backend for Angular, Ember , Etc..."
  s.description = "A fast and hackable JSON API engine based on EventMachine to be used as a backend for Angular,
  ember and all sorts of things. It is REALLY fast and have a DSL like sinatra, also have an embebed cache system"

  s.required_rubygems_version = ">= 0"
  s.add_runtime_dependency "eventmachine", '~> 1.2.0'
  s.add_runtime_dependency "yajl-ruby", '< 2'
  s.add_runtime_dependency "eventmachine_httpserver",'~> 0'

  s.files = Dir.glob("{bin,lib}/**/*")
  s.license = 'MIT'
end
