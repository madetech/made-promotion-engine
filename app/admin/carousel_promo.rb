require Promotion::Engine.root.join('app', 'inputs', 'hotspot_input')

if defined?(ActiveAdmin) and !Promotion.config.local_admin_pages.include?(:carousel_promo)
  ActiveAdmin.register Promotion.localisable_class(:CarouselPromo) do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title

    menu :parent => "Promotions", :label => "Carousel"

    form do |f|
      f.inputs do
        f.input :title

        f.has_many :carousel_promo_images do |f_image|
          f_image.input :image, :hint => f_image.template.image_tag(f_image.object.image.url(:thumb))
          f_image.input :order
          f_image.localise_has_many(:carousel_promo_image_hotspots, [
            [:x, {:localisable => false, :as => :hotspot, :hotspot => :x}],
            [:y, {:localisable => false, :as => :hotspot, :hotspot => :y, :show_image => false}],
            [:link],
            [:link_text]
          ])

          f_image.input :_destroy, :as => :boolean, :label => "Delete" if !f_image.object.nil?
        end

        f.promotion_common_inputs
      end

      f.actions
    end

    index do
      column :title

      default_actions
    end
  end
end
