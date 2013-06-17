class CreatePromotionCarouselPromoImages < ActiveRecord::Migration
  def change
    create_table :promotion_carousel_promo_images do |t|
      t.integer :carousel_promo_id
      t.integer :order
      t.string  :type
      t.timestamps
    end

    add_attachment :promotion_carousel_promo_images, :image

    add_index :promotion_carousel_promo_images, :order
  end
end
