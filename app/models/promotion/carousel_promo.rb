module Promotion
  class CarouselPromo < Promotion::Promo
    attr_accessible                 :carousel_promo_images_attributes

    has_many                        :carousel_promo_images

    accepts_nested_attributes_for   :carousel_promo_images, :allow_destroy => true
  end
end
