require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  before do
    @valid_attributes = {:title => "Understanding Rails Routes",
                         :url => "http://railsnotes.com/213-understanding-routes-rb/",
                         :author => "Melvin Ram",
                         :published_on => nil}

  end
  it 'is valid with valid attributes' do
    a = Article.new(@valid_attributes)
    a.should be_valid
  end

  describe "requires a title" do
    it "which can't be empty string" do
      invalid_attributes = @valid_attributes.merge(:title => "")
      Article.new(invalid_attributes).should_not be_valid
    end

    it "which can't be nil" do
      invalid_attributes = @valid_attributes.merge(:title => nil)
      Article.new(invalid_attributes).should_not be_valid
    end
  end

  describe "requires a URL" do
    it "which can't be empty string" do
      invalid_attributes = @valid_attributes.merge(:url => "")
      Article.new(invalid_attributes).should_not be_valid
    end

    it "which can't be nil" do
      invalid_attributes = @valid_attributes.merge(:url => nil)
      Article.new(invalid_attributes).should_not be_valid
    end
  end

  it "allows very long url (4K chars)" do
    @valid_attributes[:url] = "http://" +"."*(4*1024 - 7)
    a = Article.new(@valid_attributes)
    a.should be_valid
    a.save!  # make sure database column is big enough
  end

  describe "allows author to be blank (if unknown)" do
    it "which can be empty string" do
      @valid_attributes[:author] = nil
      Article.create!(@valid_attributes)
    end

    it "which can be nil" do
      @valid_attributes[:author] = ""
      Article.create!(@valid_attributes)
    end
  end

  describe "allows published_on to be blank (if unknown)" do
    it "which can be empty string" do
      Article.create!(@valid_attributes)
    end

    it "which can be nil" do
      @valid_attributes[:published_on] = ""
      Article.create!(@valid_attributes)
    end
  end

end
