module Promotion
  module Localisable
    class ImageLinkPromo < Promotion::Localisable::Promo
      translates                      :link
      active_admin_translates         :link

      attr_accessible                 :image

      has_attached_file               :image, :styles => Promotion.config.image_styles

      validates_presence_of           :image
    end
  end
end
