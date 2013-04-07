require "promotion/engine"
require Promotion::Engine.root.join('app', 'validators', 'promotion')

module Promotion
  mattr_accessor :cache_sweeper
  @@cache_sweeper = false

  mattr_accessor :placements
  @@placements = []

  mattr_accessor :styles
  @@styles = []

  mattr_accessor :image_styles
  @@image_styles = {}

  class Engine < Rails::Engine
    isolate_namespace Promotion

    initializer :promotion do
      ActiveAdmin.application.load_paths.unshift Dir[Promotion::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end

    config.to_prepare do
      ApplicationController.helper(ViewHelper)
    end

    ActiveModel::Validations.__send__(:include, Promotion::PromotionValidators)
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
