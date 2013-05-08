class CreatePromotionImageTextPromoLinks < ActiveRecord::Migration
  def change
    if !Promotion.config.localisable
      create_table :promotion_image_text_promo_links do |t|
        t.integer :image_text_promo_id
        t.string :text_field
        t.string :text_field_link
        t.timestamps
      end
    end
  end
end
