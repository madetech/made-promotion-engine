if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::VideoPromo do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :placement

    menu :parent => "Promotions", :label => "Video", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.input :title
        f.input :html, :as => :text, :input_html => {:rows => 5}

        f.input :placement, :as => :select,
                            :collection => Promotion.config.placements.map{|k, v| [v[:label], k]},
                            :prompt => "Select a placement"

        if Promotion.config.styles.length > 0
          f.input :style,   :as => :select,
                            :collection => Promotion.config.styles.map{|k, v| [v, k]},
                            :prompt => "Select a style"
        end

        f.input :order, :as => :number
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
