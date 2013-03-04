module Promotion
  class VideoPromo < ActiveRecord::Base
    include Promotion::PromotionConcerns

    attr_accessible         :title,
                            :video_embed,
                            :placement,
                            :order

    validates_presence_of   :title,
                            :video_embed,
                            :placement
  end
end
