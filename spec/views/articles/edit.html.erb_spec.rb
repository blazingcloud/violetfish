require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/edit" do
  before do
    @article1 = Factory.create(:article, :published_on => Date.new(2009, 11, 3))

    @article2 = Factory.create(:article, :published_on => Date.new(2008, 2, 13))

    @article3 = Factory.create(:article,
                         :published_on => Date.new(2008, 1, 28))

    @article4 = Factory.create(:article,
                         :published_on => nil)

  end

  describe "new article" do
    it "should display form with create button" do
      assigns[:article] = Article.new
      render
      response.body.should have_tag "form"
      response.body.should match "Create"    
    end


  end

  describe "edit saved article" do
    it "should display article to be edited" do
      assigns[:article] = @article2
      render
      response.body.should match @article2[:title]
      response.body.should match @article2[:url]
      response.body.should match @article2[:author]
      response.body.should match "Update"
    end
  end

  describe "delete saved article" do
    it "should display a delete button" do
      assigns[:article] = @article1
      render
      response.body.should match "Delete"
    end
  end
end

