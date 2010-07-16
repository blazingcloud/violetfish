class ArticleTagsController < ApplicationController
  def create
    attrs = params[:article_tag]
    article_tag = ArticleTag.new(:article_id => attrs[:article_id],
                   :version_id => attrs[:version_id])
    article_tag.save
  end
end