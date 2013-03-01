class AddPlacementToLinkedImagePromo < ActiveRecord::Migration
  def change
    add_column :promotion_linked_image_promos, :placement, :string
  end
end
