require "promotion/engine"
require Promotion::Engine.root.join('app', 'validators', 'promotion')
require Promotion::Engine.root.join('app', 'concerns', 'promotion')

module Promotion
  class Engine < Rails::Engine
    isolate_namespace Promotion

    initializer :promotion do
      ActiveAdmin.application.load_paths.unshift Dir[Promotion::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end

    ActiveModel::Validations.__send__(:include, Promotion::PromotionValidators)
  end

  def self.config(&block)
    @@config ||= Promotion::Engine::Configuration.new

    yield @@config if block

    return @@config
  end
end
