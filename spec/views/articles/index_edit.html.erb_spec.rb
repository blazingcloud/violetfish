require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/index_edit" do
  before do
    @article1 = Factory.create(:article, :published_on => Date.new(2009, 11, 3))

    @article2 = Factory.create(:article, :published_on => Date.new(2008, 2, 13))

    @article3 = Factory.create(:article,
                         :published_on => Date.new(2008, 1, 28))

    @article4 = Factory.create(:article,
                         :published_on => nil)

  end
  it "should display articles" do
    assigns[:articles] = [@article1, @article2, @article3, @article4]
    render
    response.body.should have_tag("a[href=?]", edit_article_path(@article1), :text => @article1.title)
  end

end

