class ArticlesController < ApplicationController
  def index
      @articles = Article.all(:order => "published_on DESC")
  end

  def new
    @article = Article.new
    render "edit"
  end

  def create
    attrs = params[:article]
    @article = Article.new :title => attrs[:title],
                           :url => attrs[:url],
                           :published_on => attrs[:published_on],
                           :author => attrs[:author]
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
    attrs = params[:article]
    @article.update_attributes :title => attrs[:title],
                           :url => attrs[:url],
                           :published_on => attrs[:published_on],
                           :author => attrs[:author]
    render "edit"
  end
end
