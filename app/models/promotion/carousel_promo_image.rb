module Promotion
  class CarouselPromoImage < ActiveRecord::Base
    belongs_to                        :carousel_promo
    has_many                          :carousel_promo_image_hotspots

    accepts_nested_attributes_for     :carousel_promo_image_hotspots, :allow_destroy => true

    attr_accessible                   :image,
                                      :order,
                                      :carousel_promo_image_hotspots_attributes

    has_attached_file                 :image, :styles => Promotion.config.image_styles

    default_scope                     :order => '`order` ASC'
  end
end
