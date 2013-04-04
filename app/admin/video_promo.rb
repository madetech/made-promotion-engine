if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion::VideoPromo do
    controller do
      cache_sweeper Promotion.config.cache_video_sweeper if Promotion.config.cache_video_sweeper
    end

    filter :title
    filter :video_embed
    filter :placement

    menu :parent => "Promotions", :label => "Video", :priority => 1
    form do |f|
      f.inputs "Promos" do
        f.semantic_errors *f.object.errors.keys
        f.input :title
        f.input :video_embed, :as => :text, :input_html => {:placeholder => "http://www.example.com", :rows => 5}
        f.input :placement,  :as => :select,  :collection => Promotion.config.available_pages.map{|p| p[:label]}, :prompt => "Select one:"
        f.input :order, :as => :number, :input_html => { :min => 1, :max => 4 }
      end

      f.actions
    end

    index do
      column :title
      column :video_embed
      column :placement
      column :order
      default_actions
    end

    show do |promo|
      attributes_table do
        row :title
        row :video_embed
        row :placement
        row :order
      end
    end
  end
end
