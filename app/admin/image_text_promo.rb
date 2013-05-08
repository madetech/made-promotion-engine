if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion.localisable_class("ImageTextPromo") do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :headline
    filter :placement

    menu :parent => "Promotions", :label => "Image & Text", :priority => 1

    form do |f|
      f.inputs do
        f.localise_inputs [[:title], [:headline]]

        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.promotion_common_inputs

        f.localise_has_many(:image_text_promo_links, [
          [:text_field],
          [:text_field_link, :placeholder => "http://www.example.com/"]
        ])
      end

      f.actions
    end

    index do
      column :title
      column :headline
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
