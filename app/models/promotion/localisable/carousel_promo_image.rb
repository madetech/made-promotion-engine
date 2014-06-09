if Promotion.config.localisable
  module Promotion
    module Localisable
      class CarouselPromoImage < Promotion::CarouselPromoImage
        belongs_to                        :carousel_promo
        has_many                          :carousel_promo_image_hotspots

        accepts_nested_attributes_for     :carousel_promo_image_hotspots, :allow_destroy => true

        default_scope                     :order => '`order` ASC'
      end
    end
  end
end
