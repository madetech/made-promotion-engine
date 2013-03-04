module Promotion
  module PromotionValidators
    class LimitValidator < ActiveModel::Validator
      def validate(record)
        return unless record.placement.present?
        return if !record.new_record?

        total = Promotion.config.available_pages.select {|p|
            break p if p[:label] == record.placement
        }

        placement_count = 0
        placement_count = placement_count + ImageOnlyPromo.count(:all, :conditions => {:placement => record.placement})
        placement_count = placement_count + ImageTextPromo.count(:all, :conditions => {:placement => record.placement})
        placement_count = placement_count + LinkedImagePromo.count(:all, :conditions => {:placement => record.placement})
        placement_count = placement_count + VideoPromo.count(:all, :conditions => {:placement => record.placement})

        if placement_count >= total[:max]
          record.errors.add :limit_exceeded, ": The maximum number of entries for this placement has already been reached"
        end
      end
    end
  end
end
