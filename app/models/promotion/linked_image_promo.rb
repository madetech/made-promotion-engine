module Promotion
  class LinkedImagePromo < ActiveRecord::Base
    attr_accessible           :title,
                              :image,
                              :image_link,
                              :placement,
                              :order

    has_attached_file         :image, :styles => {
                                :secondary => Promotion.config.secondary_promo_image_size,
                                :mobile => Promotion.config.mobile_promo_image_size,
                                :thumb => Promotion.config.promo_thumb_size
                              }

    validates_presence_of     :title,
                              :image,
                              :image_link,
                              :placement

    validates_with            LimitValidator
  end
end
