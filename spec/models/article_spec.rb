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

  it "requires a title"
  it "requires a URL"
  it "allows author to be blank (if unknown)"
  it "allows date to be blank (if unknown)"

  end