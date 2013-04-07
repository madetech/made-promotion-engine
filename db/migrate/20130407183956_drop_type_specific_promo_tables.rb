class DropTypeSpecificPromoTables < ActiveRecord::Migration
  def change
    drop_table :promotion_image_only_promos
    drop_table :promotion_image_text_promos
    drop_table :promotion_linked_image_promos
    drop_table :promotion_video_promos
  end
end
