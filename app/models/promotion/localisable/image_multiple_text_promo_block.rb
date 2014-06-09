if Promotion.config.localisable
  module Promotion
    module Localisable
      class ImageMultipleTextPromoBlock < ActiveRecord::Base
        translates                  :text, :order
        active_admin_translates     :text, :order

        attr_accessible             :translations

        belongs_to                  :image_multiple_text_promo
      end
    end
  end
end
