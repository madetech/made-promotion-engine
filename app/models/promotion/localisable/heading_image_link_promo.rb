module Promotion
  module Localisable
    class HeadingImageLinkPromo < Promotion::Promo
      attr_accessible           :image,
                                :link,
                                :headline

      has_attached_file         :image, :styles => Promotion.config.image_styles

      validates_presence_of     :image,
                                :link,
                                :headline
    end
  end
end
