module Promotion
  class ImageOnlyPromo < ActiveRecord::Base
    attr_accessible           :title,
                              :image,
                              :placement,
                              :order

    has_attached_file         :image, :styles => {
                                :main => Promotion.config.main_promo_image_size,
                                :secondary => Promotion.config.secondary_promo_image_size,
                                :mobile => Promotion.config.mobile_promo_image_size,
                                :thumb => Promotion.config.promo_thumb_size
                              }

    validates_presence_of     :placement,
                              :title,
                              :image

    validates_with            LimitValidator
  end
end
