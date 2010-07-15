class ArticlesController < ApplicationController
  def index
      @articles = Article.all(:order => "published_on DESC")
  end

  def new
      @article = Article.new
      render "edit"
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    render "edit"
  end

  def edit
    @article = Article.find(params[:id])
    # edit just renders edit
  end
end
