require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/edit" do
  before do
    @a1 = {:title => "Using the New Gem Bundler Today",
                         :url => "http://yehudakatz.com/2009/11/03/using-the-new-gem-bundler-today/",
                         :author => "Yehuda Katz",
                         :published_on => Date.new(2009, 11, 3)}

    @a2 = {:title => "Make Rails Associations Faster by Optimizing Named Blocks and String Callbacks",
                         :url => "http://blog.pluron.com/2008/02/rails-faster-as.html",
                         :author => "Alexander Dymo",
                         :published_on => Date.new(2008, 2, 13)}

    @a3 = {:title => "Rails REST 101 meets Rails 2.0",
                         :url => "http://www.softiesonrails.com/2008/1/29/rails-rest-101-meets-rails-2-0",
                         :author => nil,
                         :published_on => Date.new(2008, 1, 28)}
    @a4 = {:title => "Understanding Rails Routes",
                         :url => "http://railsnotes.com/213-understanding-routes-rb/",
                         :author => "Melvin Ram",
                         :published_on => nil}

    @article1 = Article.create!(@a1)
    @article2 = Article.create!(@a2)
    @article3 = Article.create!(@a3)
    @article4 = Article.create!(@a4)

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
      response.body.should match /Make Rails Associations Faster by Optimizing Named Blocks/
      response.body.should match /http:\/\/blog\.pluron\.com\/2008\/02\/rails-faster-as\.html/
      response.body.should match /Alexander Dymo/
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

