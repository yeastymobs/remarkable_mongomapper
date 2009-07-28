# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{remarkable_mongomapper}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas M\303\251rouze", "Vincent Hellot", "Mathieu Fosse"]
  s.date = %q{2009-07-28}
  s.email = %q{dev@yeastymobs.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/remarkable_mongomapper.rb",
     "lib/remarkable_mongomapper/base.rb",
     "lib/remarkable_mongomapper/matchers/have_key_matcher.rb",
     "lib/remarkable_mongomapper/matchers/validate_presence_of_matcher.rb",
     "locales/en.yml",
     "remarkable_mongomapper.gemspec",
     "spec/matchers/have_key_matcher_spec.rb",
     "spec/matchers/validate_presence_of_matcher_spec.rb",
     "spec/models.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/yeastymobs/remarkable_mongomapper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{MongoMapper Remarkable Matchers}
  s.test_files = [
    "spec/matchers/have_key_matcher_spec.rb",
     "spec/matchers/validate_presence_of_matcher_spec.rb",
     "spec/models.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<remarkable>, ["~> 3.1.8"])
      s.add_runtime_dependency(%q<mongomapper>, ["~> 0.2.0"])
    else
      s.add_dependency(%q<remarkable>, ["~> 3.1.8"])
      s.add_dependency(%q<mongomapper>, ["~> 0.2.0"])
    end
  else
    s.add_dependency(%q<remarkable>, ["~> 3.1.8"])
    s.add_dependency(%q<mongomapper>, ["~> 0.2.0"])
  end
end
