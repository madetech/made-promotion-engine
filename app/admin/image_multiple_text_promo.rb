if defined?(ActiveAdmin) and Promotion.config.engine_active_admin
  ActiveAdmin.register Promotion.localisable_class(:ImageMultipleTextPromo) do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :headline
    filter :placement

    menu :parent => "Promotions", :label => "Image & Multiple Text"

    form do |f|
      f.inputs do
        f.localise_inputs [
          [:title],
          [:headline, :label => "Link text"],
          [:link, :input_html => {:placeholder => "http://www.example.com"}]
        ]

        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.promotion_common_inputs

        f.localise_has_many(:image_multiple_text_promo_blocks, [
          [:text],
          [:order, {:as => :number}]
        ])
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
      column :placement
      column :order

      default_actions
    end
  end
end
