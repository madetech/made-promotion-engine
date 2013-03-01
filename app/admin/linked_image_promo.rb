if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::LinkedImagePromo do
    controller do
      cache_sweeper Promotion.config.cache_linked_image_sweeper if Promotion.config.cache_linked_image_sweeper
    end

    filter :title
    filter :image_link
    filter :placement

    # actions :all, :except => [:new]

    # action_item do
    #   link_to "New Linked Image Promo", new_admin_promotion_linked_image_promo_path
    # end

    menu :parent => "Promotions", :label => "Linked Image", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.semantic_errors *f.object.errors.keys
        f.input :title
        f.input :image, :as => :file
        f.input :image_link, :input_html => {:placeholder => "http://www.example.com"}
        f.input :placement,  :as => :select,  :collection => Promotion.config.available_pages.map{|p| p[:label]}, :prompt => "Select one:"
        f.input :order, :as => :number, :input_html => { :min => 1, :max => 4 }
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
      column :image_link
      column :placement
      column :order
      default_actions
    end

    show do |promo|
      attributes_table do
        row :title
        row :image do |promo|
          image_tag promo.image(:thumb)
        end
        row :image_link
        row :placement
        row :order
      end
    end
  end
end
