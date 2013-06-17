module Promotion
  class CarouselPromoImageHotspot < ActiveRecord::Base
    belongs_to                  :carousel_promo_image

    attr_accessible             :x,
                                :y,
                                :link,
                                :link_text
  end
end
