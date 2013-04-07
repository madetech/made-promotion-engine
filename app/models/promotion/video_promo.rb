module Promotion
  class VideoPromo < Promotion::Promo
    attr_accessible         :html

    validates_presence_of   :html
  end
end
