# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130125150414) do

  create_table "promotion_image_only_promos", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "image_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "placement"
    t.integer  "order"
  end

  create_table "promotion_image_text_promo_links", :force => true do |t|
    t.integer  "image_text_promo_id"
    t.string   "text_field"
    t.string   "text_field_link"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "promotion_image_text_promos", :force => true do |t|
    t.string   "title"
    t.string   "headline"
    t.string   "image"
    t.string   "image_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "text_field"
    t.string   "text_field_link"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "placement"
    t.integer  "order"
  end

  create_table "promotion_linked_image_promos", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "image_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "placement"
    t.integer  "order"
  end

  create_table "promotion_video_promos", :force => true do |t|
    t.string   "title"
    t.string   "video_embed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "placement"
    t.integer  "order"
  end

end
