class ArticlesController < ApplicationController
  def index
      @articles = Article.all(:order => "published_on DESC")
  end
end
