if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::ImageLinkPromo do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :link
    filter :placement

    menu :parent => "Promotions", :label => "Image Link", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.input :title
        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))
        f.input :link, :input_html => {:placeholder => "http://www.example.com"}

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
      column :image do |promo|
        unless promo.image.blank?
          image_tag promo.image(:thumb)
        end
      end
      column :link
      column :placement
      column :order

      default_actions
    end
  end
end
