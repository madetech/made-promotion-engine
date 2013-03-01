require 'spec_helper'

module Promotion
  describe LinkedImagePromo do
    
    before(:each) do
      @promo = FactoryGirl.create(:linked_image_promo)
    end

    it "has a valid factory" do
      @promo.should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:linked_image_promo, title: nil).should_not be_valid
    end

    it "is invalid without an image" do
      FactoryGirl.build(:linked_image_promo, image_file_name: nil).should_not be_valid
    end

    it "is invalid without an image link" do
      FactoryGirl.build(:linked_image_promo, image_link: nil).should_not be_valid
    end

    it "is invalid if a placement has not been selected" do
      FactoryGirl.build(:linked_image_promo, placement: nil).should_not be_valid
    end

    it "returns the title, image file name and image link as strings" do
      @promo.title.should == "Test"
      @promo.image_file_name.should == "image.jpg"
      @promo.image_link.should == "http://www.test.com"
    end

  end
end
