class AddStyleToImageTextPromo < ActiveRecord::Migration
  def change
    add_column :promotion_image_text_promos, :style, :string
  end
end
