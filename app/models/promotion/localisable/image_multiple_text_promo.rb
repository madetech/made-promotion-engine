module Promotion
  module Localisable
    class ImageMultipleTextPromo < Promotion::Localisable::Promo
      translates                      :headline,
                                      :link
      active_admin_translates         :headline,
                                      :link

      attr_accessible                 :image,
                                      :image_multiple_text_promo_blocks_attributes

      has_many                        :image_multiple_text_promo_blocks
      accepts_nested_attributes_for   :image_multiple_text_promo_blocks, :allow_destroy => true

      has_attached_file               :image, :styles => Promotion.config.image_styles

      validates_presence_of           :image
    end
  end
end
