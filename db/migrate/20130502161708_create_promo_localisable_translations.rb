class CreatePromoLocalisableTranslations < ActiveRecord::Migration
  def self.up
    if Promotion.config.localisable
      Promotion::Localisable::ImageTextPromo.create_translation_table! :headline => :string
      add_column :promotion_promo_translations, :html, :text
      add_column :promotion_promo_translations, :link, :string
    end
  end
  def self.down
    if Promotion.config.localisable
      Promotion::Localisable::ImageTextPromo.drop_translation_table!
    end
  end
end
