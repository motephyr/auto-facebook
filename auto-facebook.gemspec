# -*- encoding: utf-8 -*-
# stub: auto-facebook 0.43.pre.changeByMark ruby lib

Gem::Specification.new do |s|
  s.name = "auto-facebook"
  s.version = "0.43.pre.changeByMark"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["xdite"]
  s.date = "2014-03-31"
  s.description = "Auto Mount Facebook Login"
  s.email = ["xdite@rocodev.com"]
  s.files = [".gitignore", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "app/controllers/users/omniauth_callbacks_controller.rb", "app/models/user/omniauth_callbacks.rb", "auto-facebook.gemspec", "lib/auto-facebook.rb", "lib/auto/facebook/engine.rb", "lib/auto/facebook/engine3.rb", "lib/auto/facebook/railtie.rb", "lib/auto/facebook/version.rb", "lib/generators/auto_facebook/install/install_generator.rb", "lib/generators/auto_facebook/install/templates/omniauth.rb", "lib/generators/auto_facebook/user/templates/migration.rb", "lib/generators/auto_facebook/user/user_generator.rb"]
  s.homepage = "http://github.com/xdite/auto-facebook"
  s.rubygems_version = "2.2.2"
  s.summary = "Auto Mount Facebook Login"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-facebook>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 4.0.0"])
    else
      s.add_dependency(%q<omniauth>, [">= 0"])
      s.add_dependency(%q<omniauth-facebook>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<omniauth>, [">= 0"])
    s.add_dependency(%q<omniauth-facebook>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 4.0.0"])
  end
end
