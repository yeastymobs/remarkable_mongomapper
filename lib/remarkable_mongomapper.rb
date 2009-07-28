# Load Remarkable
unless Object.const_defined?('Remarkable')
  begin
    require 'remarkable'
  rescue LoadError
    require 'rubygems'
    gem 'remarkable'
    require 'remarkable'
  end
end
 
# Add locale
dir = File.dirname(__FILE__)
Remarkable.add_locale File.join(dir, '..', 'locales', 'en.yml')
 
# Add matchers
Dir[File.join(dir, 'remarkable_mongomapper', 'matchers', '*.rb')].each do |file|
  require file
end

# Include Remarkable MongoMapper matcher in appropriate ExampleGroup
if defined?(Spec::Rails)
  Remarkable.include_matchers!(Remarkable::MongoMapper, Spec::Rails::Example::ModelExampleGroup)
else
  Remarkable.include_matchers!(Remarkable::MongoMapper, Spec::Example::ExampleGroup)
end