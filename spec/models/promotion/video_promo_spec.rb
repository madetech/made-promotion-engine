require 'spec_helper'

module Promotion
  describe VideoPromo do
    
    before(:each) do
      @promo = FactoryGirl.create(:video_promo)
    end

    it "has a valid factory" do
      @promo.should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:video_promo, title: nil).should_not be_valid
    end

    it "is invalid with an embed code" do
      FactoryGirl.build(:video_promo, video_embed: nil).should_not be_valid
    end

    it "is invalid if a placement has not been selected" do
      FactoryGirl.build(:video_promo, placement: nil).should_not be_valid
    end

    it "returns the title and embed codes as strings" do
      @promo.title.should == "Test"
      @promo.video_embed.should == "http://www.example.com"
    end

  end
end
