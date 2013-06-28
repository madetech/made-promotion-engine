require "promotion/engine"
require Promotion::Engine.root.join('app', 'validators', 'promotion')
require "globalize3"
require "activeadmin-globalize3"

module Promotion
  mattr_accessor :cache_sweeper
  @@cache_sweeper = false

  mattr_accessor :placements
  @@placements = []

  mattr_accessor :styles
  @@styles = []

  mattr_accessor :image_styles
  @@image_styles = {}

  mattr_accessor :localisable
  @@localisable = false

  class Engine < Rails::Engine
    isolate_namespace Promotion

    initializer :promotion do
      require "active_admin_extension"
      ActiveAdmin.application.load_paths.unshift Dir[Promotion::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
      ActiveAdmin.application.register_stylesheet "promotion_admin.css", :media => :screen
      ActiveAdmin.application.register_javascript "promotion_admin.js"
    end

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( promotion_admin.css promotion_admin.js )
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

  def self.localisable_class(class_name)
    if Promotion.config.localisable
      namespaced_class = "Promotion::Localisable::#{class_name}"
    else
      namespaced_class = "Promotion::#{class_name}"
    end

    namespaced_class.constantize
  end
end
