class AddIndexesToLinkedImagePromo < ActiveRecord::Migration
  def change
    add_index :promotion_linked_image_promos, :placement
    add_index :promotion_linked_image_promos, :order
  end
end
