require 'spec_helper'

describe ArticleTag do
  before(:each) do
    a = Factory.create(:article)
    v = Factory.create(:version)
    @valid_attributes = {
      :article_id => a.id,
      :version_id => v.id
    }
  end

  it "should create a new instance given valid attributes" do
    ArticleTag.create!(@valid_attributes)
  end

  it "requires an article" do
    invalid_attrs = @valid_attributes.merge(:article_id =>nil)
    ArticleTag.new(invalid_attrs).should_not be_valid
  end

  it "requires an version" do
    invalid_attrs = @valid_attributes.merge(:version_id =>nil)
    ArticleTag.new(invalid_attrs).should_not be_valid
  end
end
