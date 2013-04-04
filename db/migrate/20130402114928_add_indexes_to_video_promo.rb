class AddIndexesToVideoPromo < ActiveRecord::Migration
  def change
    add_index :promotion_video_promos, :placement
    add_index :promotion_video_promos, :order
  end
end
