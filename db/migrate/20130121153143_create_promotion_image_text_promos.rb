class CreatePromotionImageTextPromos < ActiveRecord::Migration
  def change
    create_table :promotion_image_text_promos do |t|
      t.string :title
      t.string :headline
      t.string :image
      t.string :image_link
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.string :text_field
      t.string :text_field_link
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end
end
