if defined?(ActiveAdmin) and Promotion.config.engine_active_admin
  ActiveAdmin.register Promotion.localisable_class(:VideoPromo) do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :placement

    menu :parent => "Promotions", :label => "Video"

    form do |f|
      f.inputs do
        f.localise_inputs [
          [:title],
          [:html, :as => :text, :input_html => {:rows => 5}, :label => "HTML"]
        ]

        f.promotion_common_inputs
      end

      f.actions
    end

    index do
      column :title
      column :placement
      column :order

      default_actions
    end
  end
end
