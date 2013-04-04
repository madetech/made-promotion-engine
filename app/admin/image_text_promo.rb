if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::ImageTextPromo do
    controller do
      cache_sweeper Promotion.config.cache_image_text_sweeper if Promotion.config.cache_image_text_sweeper
    end

    filter :title
    filter :headline
    filter :placement

    menu :parent => "Promotions", :label => "Image & Text", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.semantic_errors *f.object.errors.keys
        f.input :title
        f.input :headline
        f.input :image, :as => :file
        f.has_many :image_text_promo_links do |f_link|
          f_link.inputs do
            f_link.input :text_field
            f_link.input :text_field_link, :input_html => {:placeholder => "http://www.example.com"}
          end
        end
        f.input :placement,  :as => :select,  :collection => Promotion.config.available_pages.map{|p| p[:label]}, :prompt => "Select one:"
        f.input :order, :as => :number, :input_html => { :min => 1, :max => 4 }
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

    show do |promo|
      attributes_table do
        row :title
        row :headline
        row :image do |promo|
          image_tag promo.image(:thumb)
        end
        row :placement
        row :order
      end
    end
  end
end
