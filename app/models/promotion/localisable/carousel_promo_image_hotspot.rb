if Promotion.config.localisable
  module Promotion
    module Localisable
      class CarouselPromoImageHotspot < ActiveRecord::Base
        belongs_to                      :carousel_promo_image

        attr_accessible                 :x,
                                        :y

        translates                      :link,
                                        :link_text
        active_admin_translates         :link,
                                        :link_text
      end
    end
  end
end
