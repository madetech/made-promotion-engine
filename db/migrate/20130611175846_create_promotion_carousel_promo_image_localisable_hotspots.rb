class CreatePromotionCarouselPromoImageLocalisableHotspots < ActiveRecord::Migration
  def self.up
    if Promotion.config.localisable
      Promotion::Localisable::CarouselPromoImageHotspot.create_translation_table! :link => :string, :link_text => :string
    end
  end
  def self.down
    if Promotion.config.localisable
      Promotion::Localisable::CarouselPromoImageHotspot.drop_translation_table!
    end
  end
end
