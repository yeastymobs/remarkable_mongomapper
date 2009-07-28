class Article
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :body, String
end