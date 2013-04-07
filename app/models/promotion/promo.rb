module Promotion
  class Promo < ActiveRecord::Base
    attr_accessible           :title,
                              :placement,
                              :style,
                              :order

    validates_presence_of     :title
    validates                 :placement, :presence => true, :"promotion/promotion_validators/placement_limit" => true

    default_scope             :order => '`order` ASC'
  end
end
