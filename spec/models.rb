class Article
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :body, String
  
  many :comments
  belongs_to :user
end

class Comment
  include MongoMapper::EmbeddedDocument
  
  key :body, String
end

class User
  include MongoMapper::Document
  
  key :login, String
end