if defined?(ActiveAdmin) and Promotion.config.engine_active_admin and !Promotion.config.local_admin_pages.include?(:heading_image_link)
  ActiveAdmin.register Promotion.localisable_class(:HeadingImageLinkPromo) do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :headline
    filter :placement

    menu :parent => "Promotions", :label => "Image & Heading Link"

    form do |f|
      f.inputs do
        f.input :title
        f.input :headline
        f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))
        f.input :link

        f.promotion_common_inputs
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
