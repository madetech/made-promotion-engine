class CreatePromotionImageTextPromoLocalisableLinks < ActiveRecord::Migration
  def self.up
    if Promotion.config.localisable
      Promotion::Localisable::ImageTextPromoLink.create_translation_table! :text_field => :string, :text_field_link => :string
      create_table :promotion_image_text_promo_links do |t|
        t.integer :image_text_promo_id
        t.timestamps
      end
    end
  end
  def self.down
    if Promotion.config.localisable
      Promotion::Localisable::ImageTextPromoLink.drop_translation_table!
      drop_table :promotion_image_text_promo_links
    end
  end
end
