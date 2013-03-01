class CreatePromotionVideoPromos < ActiveRecord::Migration
  def change
    create_table :promotion_video_promos do |t|
      t.string :title
      t.string :video_embed
      
      t.timestamps
    end
  end
end
