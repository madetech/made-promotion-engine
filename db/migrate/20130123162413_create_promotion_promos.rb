class CreatePromotionPromos < ActiveRecord::Migration
  def change
    create_table :promotion_promos do |t|
      t.string :placement
      t.boolean :mobile
      t.timestamps
    end
  end
end
