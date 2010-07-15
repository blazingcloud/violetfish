require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do
  before do
    @a1 = Factory.attributes_for(:article, :published_on => Date.new(2009, 11, 3))

    @a2 = Factory.attributes_for(:article, :published_on => Date.new(2008, 2, 13))

    @a3 = Factory.attributes_for(:article,
                         :published_on => Date.new(2008, 1, 28))
    
    @a4 = Factory.attributes_for(:article,
                         :published_on => nil)

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

    describe "GET index edit" do
      it "renders" do
        get :index_edit
        assigns[:articles].should == [@article1, @article2, @article3, @article4]
        response.should render_template('index_edit')
      end
    end

    describe "GET new" do
      it "renders" do
        get :new
        assigns[:article].should be_new_record
        response.should render_template('edit')
      end

      describe "PUT update" do
        it "updates an article" do
          put :update, :id => @article1[:id], :article => @a2

          updated_article = assigns[:article]
          updated_article[:title].should == @a2[:title]
          updated_article[:url].should == @a2[:url]
          updated_article[:author].should == @a2[:author]
          response.should render_template('edit')
        end

        it "updates an article, sending creation time should ignore sent attr" do
          put :update, :id => @article1[:id], :article => @a2.merge(:created_at =>(Time.now-100.days))

          updated_article = assigns[:article]
          updated_article[:created_at].should > (Time.now - 1.days)
        end

      end
    end

    describe "GET edit" do
      it "renders" do
        get :edit, {:id => @article1[:id]}
        assigns[:article].should == @article1
        response.should render_template('edit')
      end
    end

    describe "DELETE delete" do
      it "deletes an article" do
        id = @article2[:id]
        delete :destroy, {:id => id}
        Article.exists?(id).should_not be_true
        response.should redirect_to(root_path)
      end
    end
  end
  describe "POST create" do
    it "creates an article" do
      post :create, :article => @a1
      a = Article.find_by_title(@a1[:title])
      a.title.should == @a1[:title]
      a.url.should == @a1[:url]
      response.should redirect_to(edit_article_path(a))
    end

    it "creates an article, sending creation time should ignore sent attr" do
      post :create, :article => @a1.merge(:created_at =>(Time.now-100.days))
      a = Article.find_by_title(@a1[:title])
      a.created_at.should > (Time.now - 1.days)
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

