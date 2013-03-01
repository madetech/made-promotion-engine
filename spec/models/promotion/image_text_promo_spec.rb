require 'spec_helper'

module Promotion
  describe ImageTextPromo do
    before(:each) do
      @promo = FactoryGirl.create(:image_text_promo)
    end

    it "has a valid factory" do
      @promo.should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:image_text_promo, title: nil).should_not be_valid
    end

    it "is invalid without a headline" do
      FactoryGirl.build(:image_text_promo, headline: nil).should_not be_valid
    end

    it "is invalid without an image" do
      FactoryGirl.build(:image_text_promo, image_file_name: nil).should_not be_valid
    end

    it "is invalid if a text field doesn't have a corresponding url field filled out" do
      FactoryGirl.build(:image_text_promo_link, text_field_link: nil).should_not be_valid
    end

    it "is invalid if a placement has not been selected" do
      FactoryGirl.build(:image_text_promo, placement: nil).should_not be_valid
    end

    it "returns the title, headline and image file name as strings" do
      @promo.title.should == "Test"
      @promo.headline.should == "Example Headline"
      @promo.image_file_name == "image.jpg"
    end

  end
end
