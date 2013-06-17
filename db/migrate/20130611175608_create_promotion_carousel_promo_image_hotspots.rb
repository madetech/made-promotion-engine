class CreatePromotionCarouselPromoImageHotspots < ActiveRecord::Migration
  def change
    create_table :promotion_carousel_promo_image_hotspots do |t|
      t.integer :carousel_promo_image_id
      t.integer :x
      t.integer :y
      t.string :link
      t.string :link_text
      t.timestamps
    end
  end
end
