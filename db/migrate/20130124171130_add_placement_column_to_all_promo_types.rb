class AddPlacementColumnToAllPromoTypes < ActiveRecord::Migration
  def change
    add_column :promotion_video_promos, :placement, :string
    add_column :promotion_image_only_promos, :placement, :string
    add_column :promotion_image_text_promos, :placement, :string
  end
end
