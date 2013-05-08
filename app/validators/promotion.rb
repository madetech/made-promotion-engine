module Promotion
  module PromotionValidators
    class PlacementLimitValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.nil? or !record.new_record? or !Promotion.config.placements[value].has_key?(:max)

        if Promotion::Promo.count(:conditions => get_conditions(record, value)) >= Promotion.config.placements[value][:max]
          record.errors[attribute] << "The maximum number of entries for this placement has already been reached"
        end
      end

      private
      def get_conditions(record, placement)
        conditions = {:placement => placement}

        conditions[:market] = record.market if Promotion.config.localisable

        conditions
      end
    end
  end
end
