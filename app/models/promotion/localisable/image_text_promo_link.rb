module Promotion
  module Localisable
    class ImageTextPromoLink < ActiveRecord::Base
      translates                  :text_field, :text_field_link
      active_admin_translates     :text_field, :text_field_link

      attr_accessible             :translations

      belongs_to                  :image_text_promo_localisable

      #validates_presence_of      :text_field, :if => :text_field_link?
      #validates_presence_of      :text_field_link, :if => :text_field?
    end
  end
end
