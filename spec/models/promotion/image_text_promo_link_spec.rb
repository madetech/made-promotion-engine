require 'spec_helper'

module Promotion
  describe ImageTextPromoLink do
    
    before(:each) do
      @link = FactoryGirl.create(:image_text_promo_link)
    end

    it "has a valid factory" do
      @link.should be_valid
    end

    it "is invalid if a text field is filled out without an associated text field link" do
      FactoryGirl.build(:image_text_promo_link, text_field_link: nil).should_not be_valid
    end

    it "is invalid if a text field link is filled out without an associated text field" do
      FactoryGirl.build(:image_text_promo_link, text_field: nil).should_not be_valid
    end
    
  end

end
