class AddOrderColumnToAllPromoTypes < ActiveRecord::Migration
  def change
    add_column :promotion_image_text_promo_links, :order, :integer
    add_column :promotion_image_text_promos, :order, :integer
    add_column :promotion_image_only_promos, :order, :integer
    add_column :promotion_linked_image_promos, :order, :integer
    add_column :promotion_video_promos, :order, :integer
  end
end
