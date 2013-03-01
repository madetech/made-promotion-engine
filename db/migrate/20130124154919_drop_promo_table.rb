class DropPromoTable < ActiveRecord::Migration
  def change
    drop_table :promotion_promos
  end
end
