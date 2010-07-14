require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do
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

  end

  describe "viewing data" do
    before do
      @article1 = Article.create!(@a1)
      @article2 = Article.create!(@a2)
      @article3 = Article.create!(@a3)
      @article4 = Article.create!(@a4)      
    end
    describe "GET index" do
      it "renders" do
        get :index
        assigns[:articles].should == [@article1, @article2, @article3, @article4]
        response.should render_template('index')
      end
    end

    describe "GET new" do
      it "renders" do
        get :new
        assigns[:article].should be_new_record
        response.should render_template('edit')
      end
    end

    describe "GET edit" do
      it "renders" do
        pending
        get :edit, {:id => 1}
        assigns[:article].should == @article1
        response.should render_template('edit')
      end
    end
  end
  describe "POST create" do
    it "creates an article" do
      post :create, :article => @a1
      a = Article.find_by_title(@a1[:title])
      a.title.should == @a1[:title]
      a.url.should == @a1[:url]
      response.should render_template("edit")
    end
    
    it "with invalid params renders new with errors" do
      invalid_attrs = @a1.merge(:title => "")
      post :create, :article => invalid_attrs
      response.should render_template("edit")
      new_article = assigns[:article]
      new_article.should_not be_nil
      new_article.errors.length.should == 1
    end
  end
end

