module Promotion
  class ImageMultipleTextPromoBlock < ActiveRecord::Base
    attr_accessible             :text,
                                :order

    belongs_to                  :image_multiple_text_promo
  end
end
