module Promotion
  module PromotionValidators
    class PlacementLimitValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.nil? or !record.new_record?

        if Promotion::Promo.count(:conditions => {:placement => value}) >= Promotion.config.placements[value][:max]
          record.errors[attribute] << "The maximum number of entries for this placement has already been reached"
        end
      end
    end
  end
end
