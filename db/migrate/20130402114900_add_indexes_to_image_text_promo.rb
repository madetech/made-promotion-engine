class AddIndexesToImageTextPromo < ActiveRecord::Migration
  def change
    add_index :promotion_image_text_promos, :placement
    add_index :promotion_image_text_promos, :order
  end
end
