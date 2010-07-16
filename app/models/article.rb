class Article < ActiveRecord::Base
  validates_presence_of :title, :url
  has_many :article_tags
  has_many :versions, :through => :article_tags
end
