class CreateImageMultipleTextPromoBlock < ActiveRecord::Migration
  def change
    create_table :promotion_image_multiple_text_promo_blocks do |t|
      t.integer :image_multiple_text_promo_id
      t.text :text
      t.timestamps
    end
  end
end
