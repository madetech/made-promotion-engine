class AddIndexesToImageOnlyPromo < ActiveRecord::Migration
  def change
    add_index :promotion_image_only_promos, :placement
    add_index :promotion_image_only_promos, :order
  end
end
