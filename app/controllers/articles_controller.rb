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
    if @article.save
      redirect_to edit_article_path(@article)
    else
      render "edit"
    end
  end

  def edit
    @article = Article.find(params[:id])
    # edit just renders edit
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    render "edit"
  end
end
