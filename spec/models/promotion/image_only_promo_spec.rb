require 'spec_helper'

module Promotion
  describe ImageOnlyPromo do

    before(:each) do
      @promo = FactoryGirl.create(:image_only_promo)
    end

    it "has a valid factory" do
      @promo.should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:image_only_promo, title: nil).should_not be_valid
    end

    it "is invalid without an image" do
      FactoryGirl.build(:image_only_promo, image_file_name: nil).should_not be_valid
    end

    it "is invalid if a placement has not been selected" do
      FactoryGirl.build(:image_only_promo, placement: nil).should_not be_valid
    end

    it "returns the title and image file name as strings" do
      @promo.title.should == "Test"
      @promo.image_file_name.should == "image.jpg"
    end

  end
end
