require 'spec_helper'

describe Tech do
  before do
    @valid_attributes = Factory.attributes_for(:tech)
  end

  it "should create a new instance given valid attributes" do
    Tech.create!(@valid_attributes)
  end

  describe "requires a name" do
    it "which can't be empty string" do
      invalid_attributes = @valid_attributes.merge(:name => "")
      Tech.new(invalid_attributes).should_not be_valid
    end

    it "which can't be nil" do
      invalid_attributes = @valid_attributes.merge(:name => nil)
      Tech.new(invalid_attributes).should_not be_valid
    end
  end

  it "has many versions" do
    t = Factory.build(:tech)
    t.versions.should == []
  end
end
