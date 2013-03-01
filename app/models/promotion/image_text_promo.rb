module Promotion
  class ImageTextPromo < ActiveRecord::Base
    attr_accessible                 :title,
                                    :headline,
                                    :image,
                                    :image_text_promo_links_attributes,
                                    :placement,
                                    :order

    has_many                        :image_text_promo_links

    accepts_nested_attributes_for   :image_text_promo_links

    has_attached_file               :image, :styles => {
                                        :large => Promotion.config.main_promo_image_size,
                                        :mobile => Promotion.config.mobile_promo_image_size,
                                        :thumb => Promotion.config.promo_thumb_size
                                    }

    validates_presence_of           :title,
                                    :headline,
                                    :image,
                                    :placement

    validates_with                  LimitValidator

    default_scope                   :order => '`order` ASC'
  end
end
