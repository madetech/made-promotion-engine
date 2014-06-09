if Promotion.config.localisable
  module Promotion
    module Localisable
      class CarouselPromo < Promotion::CarouselPromo
        has_many                        :carousel_promo_images

        accepts_nested_attributes_for   :carousel_promo_images, :allow_destroy => true
      end
    end
  end
end
