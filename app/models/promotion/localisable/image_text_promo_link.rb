module Promotion
  module Localisable
    class ImageTextPromoLink < ActiveRecord::Base
      translates                  :text_field, :text_field_link
      active_admin_translates     :text_field, :text_field_link

      attr_accessible             :translations

      belongs_to                  :image_text_promo_localisable
    end
  end
end
