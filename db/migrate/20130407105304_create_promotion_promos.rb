class CreatePromotionPromos < ActiveRecord::Migration
  def change
    create_table :promotion_promos do |t|
      t.string  :title
      t.string  :placement
      t.string  :type
      t.string  :style
      t.integer :order

      # Type specific fields
      t.string  :headline
      t.string  :link
      t.text    :html

      t.timestamps
    end

    add_attachment :promotion_promos, :image

    add_index :promotion_promos, :order
    add_index :promotion_promos, :placement
  end
end
