require 'active_record'
require 'active_support/concern'

module Promotion
  module PromotionConcerns
    extend ActiveSupport::Concern

    included do
      validates_with            Promotion::PromotionValidators::LimitValidator

      default_scope             :order => '`order` ASC'
    end
  end
end
