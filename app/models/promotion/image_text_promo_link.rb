module Promotion
  class ImageTextPromoLink < ActiveRecord::Base
    attr_accessible         :text_field,
                            :text_field_link

    belongs_to              :image_text_promo

    validates_presence_of   :text_field, :if => :text_field_link?
    validates_presence_of   :text_field_link, :if => :text_field?
  end
end
