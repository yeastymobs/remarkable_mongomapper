require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "remarkable_mongomapper"
    gem.summary = %Q{MongoMapper Remarkable Matchers}
    gem.email = "dev@yeastymobs.com"
    gem.homepage = "http://github.com/yeastymobs/remarkable_mongomapper"
    gem.authors = ["Nicolas Mérouze", "Vincent Hellot", "Mathieu Fosse"]
    
    gem.add_dependency('remarkable',  '~> 3.1.8')
    gem.add_dependency('mongomapper', '~> 0.3.1')
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

desc 'Default: run specs.'
task :default => :spec

desc 'Run all the specs for the machinist plugin.'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = false
end