require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticleTagsController do
  before do
    @article = Factory.create(:article)
    @version = Factory.create(:version)
  end


  describe "POST create" do
    it "creates an article tag" do
      attrs = {:article_id => @article.id, :version_id => @version.id}
      post :create, :article_tag => attrs
      at = ArticleTag.find_by_article_id_and_version_id(@article.id, @version.id)
      at.should_not be_nil
    end

    it "creates an article, sending creation time should ignore sent attr" do
      pending
      post :create, :article => @a1.merge(:created_at =>(Time.now-100.days))
      a = Article.find_by_title(@a1[:title])
      a.created_at.should > (Time.now - 1.days)
    end

    it "with invalid params renders new with errors" do
      pending
      invalid_attrs = @a1.merge(:title => "")
      post :create, :article => invalid_attrs
      response.should render_template("edit")
      new_article = assigns[:article]
      new_article.should_not be_nil
      new_article.errors.length.should == 1
    end
  end
end

