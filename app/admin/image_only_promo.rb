if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::ImageOnlyPromo do
    controller do
      cache_sweeper Promotion.config.cache_image_only_sweeper if Promotion.config.cache_image_only_sweeper
    end

    filter :title
    filter :placement

    menu :parent => "Promotions", :label => "Image Only", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.semantic_errors *f.object.errors.keys
        f.input :title
        f.input :image, :as => :file
        f.input :placement,  :as => :select, :collection => Promotion.config.available_pages.map{|p| p[:label]}, :prompt => "Select one:"
        f.input :order, :as => :number, :input_html => { :min => 1, :max => 4 }
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

    show do |promo|
      attributes_table do
        row :title
        row :image do |promo|
          image_tag promo.image(:thumb)
        end
        row :placement
        row :order
      end
    end
  end
end
