module Promotion
  class ImageTextPromo < Promotion::Promo
    attr_accessible                 :headline,
                                    :image,
                                    :image_text_promo_links_attributes

    has_many                        :image_text_promo_links
    accepts_nested_attributes_for   :image_text_promo_links, :allow_destroy => true

    has_attached_file               :image, :styles => Promotion.config.image_styles

    validates_presence_of           :image
  end
end
