require "promotion/engine"
require Promotion::Engine.root.join('app', 'validators', 'promotion')
require Promotion::Engine.root.join('app', 'concerns', 'promotion')

module Promotion
  mattr_accessor :cache_image_only_sweeper
  @@cache_image_only_sweeper = false

  mattr_accessor :cache_image_text_sweeper
  @@cache_image_text_sweeper = false

  mattr_accessor :cache_linked_image_sweeper
  @@cache_linked_image_sweeper = false

  mattr_accessor :cache_video_sweeper
  @@cache_video_sweeper = false

  mattr_accessor :available_pages
  @@available_pages = []

  mattr_accessor :main_promo_image_size
  @@main_promo_image_size = ["274x394>", :jpg]

  mattr_accessor :secondary_promo_image_size
  @@secondary_promo_image_size = ["231x150", :jpg]

  mattr_accessor :mobile_promo_image_size
  @@mobile_promo_image_size = ["150x150>", :jpg]

  mattr_accessor :promo_thumb_size
  @@promo_thumb_size = ["70x70>", :jpg]


  class Engine < Rails::Engine
    isolate_namespace Promotion

    initializer :promotion do
      ActiveAdmin.application.load_paths.unshift Dir[Promotion::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end

    ActiveModel::Validations.__send__(:include, Promotion::PromotionValidators)
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
