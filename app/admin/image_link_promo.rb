if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion.localisable_class("ImageLinkPromo") do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :link
    filter :placement

    menu :parent => "Promotions", :label => "Image Link", :priority => 1
    form do |f|
      f.inputs do
        f.localise_inputs [
          [:title],
          [:link, :input_html => {:placeholder => "http://www.example.com"}]
        ]

        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.promotion_common_inputs
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
