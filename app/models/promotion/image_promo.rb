module Promotion
  class ImagePromo < Promotion::Promo
    attr_accessible           :image

    has_attached_file         :image, :styles => Promotion.config.image_styles

    validates_presence_of     :image
  end
end
