class Article
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :body, String
  
  many :comments
  many :unknowns
  many :ratings, :class_name => "Rate"
  many :assets
  belongs_to :user
  belongs_to :unknown
  belongs_to :site, :class_name => 'Site'
end

class Comment
  include MongoMapper::EmbeddedDocument
  
  key :body, String
end

class User
  include MongoMapper::Document
  
  key :login, String
end

class Rate
  include MongoMapper::EmbeddedDocument
end

class Rating
  include MongoMapper::EmbeddedDocument
end

class Site
  include MongoMapper::Document
end

class Webiste
  include MongoMapper::EmbeddedDocument
end