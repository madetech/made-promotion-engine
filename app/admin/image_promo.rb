if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::ImagePromo do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :placement

    menu :parent => "Promotions", :label => "Image"

    form do |f|
      f.inputs "Promos" do
        f.input :title
        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.promotion_common_inputs
      end

      f.actions
    end

    index :title => "Image Only Promos" do
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
