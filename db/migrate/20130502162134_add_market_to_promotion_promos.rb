class AddMarketToPromotionPromos < ActiveRecord::Migration
  def change
    if Promotion.config.localisable
      add_column :promotion_promos, :market, :string
      add_index :promotion_promos, :market
    end
  end
end
