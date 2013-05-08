if defined?(ActiveAdmin)
  ActiveAdmin.register Promotion.localisable_class("TextLinkPromo") do
    controller do
      cache_sweeper Promotion.config.cache_sweeper if Promotion.config.cache_sweeper
    end

    filter :title
    filter :link
    filter :placement

    menu :parent => "Promotions", :label => "Text Link", :priority => 1
    form do |f|
      f.inputs do
        f.localise_inputs [
          [:title],
          [:headline],
          [:link, :input_html => {:placeholder => "http://www.example.com"}]
        ]

        f.promotion_common_inputs
      end

      f.actions
    end

    index do
      column :title
      column :link
      column :placement
      column :order

      default_actions
    end
  end
end
