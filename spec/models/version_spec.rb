require 'spec_helper'

describe Version do
  before do
    @valid_attributes = Factory.attributes_for(:version)
  end

  it "should create a new instance given valid attributes" do
    Version.create!(@valid_attributes)
  end

  describe "requires a name" do
    it "which can't be empty string" do
      invalid_attributes = @valid_attributes.merge(:name => "")
      Version.new(invalid_attributes).should_not be_valid
    end

    it "which can't be nil" do
      invalid_attributes = @valid_attributes.merge(:name => nil)
      Version.new(invalid_attributes).should_not be_valid
    end
  end

  describe "belongs to Tech" do
    it "for new instance" do
      v = Factory.build(:version)
      v.tech.should == nil
    end

    it "will save a tech when the version is saved" do
      v = nil
      lambda {
        lambda {
          v = Factory.build(:version)
          v.tech = Factory.build(:tech)
          v.save
        }.should change(Version, :count).by(1)
      }.should change(Tech, :count).by(1)

    end
  end
end
