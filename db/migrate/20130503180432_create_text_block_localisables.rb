class CreateTextBlockLocalisables < ActiveRecord::Migration
  def self.up
    if Promotion.config.localisable
      Promotion::Localisable::ImageMultipleTextPromoBlock.create_translation_table! :text => :text, :order => :string
      add_index :promotion_image_multiple_text_promo_block_translations, :order
    end
  end
  def self.down
    if Promotion.config.localisable
      Promotion::Localisable::ImageMultipleTextPromoBlock.drop_translation_table!
    end
  end
end
