require "rubygems"

gem "mongomapper", "~> 0.3.1"
require "mongomapper"

MongoMapper.database = "remarkable_mongomapper"

def reset_test_db!
  MongoMapper.connection.drop_database("remarkable_mongomapper")
end

Spec::Runner.configure do |config|
  config.before(:all) { reset_test_db! }
  config.after(:all)  { reset_test_db! }
end

require File.join(File.dirname(__FILE__), "..", "lib", "remarkable_mongomapper")
require File.join(File.dirname(__FILE__), "models")
require File.join(File.dirname(__FILE__), "model_builder")