class RemoveUnnecessaryOrderColumn < ActiveRecord::Migration
  def change
    remove_column :promotion_image_text_promo_links, :order
  end
end
