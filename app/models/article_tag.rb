class ArticleTag < ActiveRecord::Base
  validates_presence_of :article_id, :version_id
  belongs_to :version
end
