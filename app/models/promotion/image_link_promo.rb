module Promotion
  class ImageLinkPromo < Promotion::Promo
    attr_accessible           :image,
                              :link

    has_attached_file         :image, :styles => Promotion.config.image_styles

    validates_presence_of     :image,
                              :link
  end
end
