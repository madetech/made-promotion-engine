module Promotion
  class VideoPromo < ActiveRecord::Base
    attr_accessible         :title,
                            :video_embed,
                            :placement,
                            :order

    validates_presence_of   :title,
                            :video_embed,
                            :placement

    validates_with          LimitValidator
  end
end
