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

ActiveRecord::Schema.define(:version => 20130924134801) do

  create_table "apps", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "api_password"
    t.integer  "thumbnail_sticker_width"
    t.integer  "thumbnail_sticker_height"
    t.integer  "actual_sticker_width"
    t.integer  "actual_sticker_height"
    t.integer  "percentage_of_revenue"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "apps", ["client_id"], :name => "index_apps_on_client_id"

  create_table "apps_packs", :id => false, :force => true do |t|
    t.integer  "app_id"
    t.integer  "pack_id"
    t.boolean  "cover_image_override"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "apps_packs", ["app_id"], :name => "index_apps_packs_on_app_id"
  add_index "apps_packs", ["pack_id"], :name => "index_apps_packs_on_pack_id"

  create_table "apps_packs_percentage", :force => true do |t|
    t.integer  "app_id"
    t.integer  "pack_id"
    t.integer  "percentage_of_revenue"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "apps_packs_percentage", ["app_id", "pack_id"], :name => "index_apps_packs_percentage_on_app_id_and_pack_id"

  create_table "artists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "percentage_of_revenue"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "artists_packs", :id => false, :force => true do |t|
    t.integer  "artist_id"
    t.integer  "pack_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artists_packs", ["artist_id"], :name => "index_artists_packs_on_artist_id"
  add_index "artists_packs", ["pack_id"], :name => "index_artists_packs_on_pack_id"

  create_table "artists_packs_percentage", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "pack_id"
    t.integer  "percentage_of_revenue"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "artists_packs_percentage", ["artist_id", "pack_id"], :name => "index_artists_packs_percentage_on_artist_id_and_pack_id"

  create_table "artists_tags", :id => false, :force => true do |t|
    t.integer  "artist_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artists_tags", ["artist_id"], :name => "index_artists_tags_on_artist_id"
  add_index "artists_tags", ["tag_id"], :name => "index_artists_tags_on_tag_id"

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.integer  "threshold_1"
    t.decimal  "threshold_1_price", :precision => 10, :scale => 0
    t.integer  "threshold_2"
    t.decimal  "threshold_2_price", :precision => 10, :scale => 0
    t.integer  "threshold_3"
    t.decimal  "threshold_3_price", :precision => 10, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "brands_packs", :id => false, :force => true do |t|
    t.integer  "brand_id"
    t.integer  "pack_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "brands_packs", ["brand_id"], :name => "index_brands_packs_on_brand_id"
  add_index "brands_packs", ["pack_id"], :name => "index_brands_packs_on_pack_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "downloads", :force => true do |t|
    t.integer  "pack_id"
    t.integer  "app_id"
    t.integer  "pack_price_id"
    t.string   "app_user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "downloads", ["app_id"], :name => "index_downloads_on_app_id"
  add_index "downloads", ["pack_id"], :name => "index_downloads_on_pack_id"
  add_index "downloads", ["pack_price_id"], :name => "index_downloads_on_pack_price_id"

  create_table "onboarding_artists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "signin_name"
    t.string   "password_digest"
    t.datetime "licensing_permission"
    t.text     "bio"
    t.string   "photo"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "onboarding_images", :force => true do |t|
    t.integer  "onboarding_artist_id"
    t.string   "file_name"
    t.string   "content_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "onboarding_images", ["onboarding_artist_id"], :name => "index_onboarding_files_on_onboarding_artist_id"

  create_table "packs", :force => true do |t|
    t.string   "title"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.boolean  "available"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "packs_prices", :force => true do |t|
    t.integer  "pack_id"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "packs_prices", ["pack_id"], :name => "index_packs_prices_on_pack_id"

  create_table "packs_stickers", :id => false, :force => true do |t|
    t.integer  "pack_id"
    t.integer  "sticker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "packs_stickers", ["pack_id"], :name => "index_packs_stickers_on_pack_id"
  add_index "packs_stickers", ["sticker_id"], :name => "index_packs_stickers_on_sticker_id"

  create_table "packs_tags", :id => false, :force => true do |t|
    t.integer  "pack_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "packs_tags", ["pack_id"], :name => "index_packs_tags_on_pack_id"
  add_index "packs_tags", ["tag_id"], :name => "index_packs_tags_on_tag_id"

  create_table "prelaunches", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stickers", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "brand_id"
    t.string   "file_name"
    t.boolean  "available"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stickers", ["artist_id"], :name => "index_stickers_on_artist_id"
  add_index "stickers", ["brand_id"], :name => "index_stickers_on_brand_id"

  create_table "stickers_tags", :id => false, :force => true do |t|
    t.integer  "sticker_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stickers_tags", ["sticker_id"], :name => "index_stickers_tags_on_sticker_id"
  add_index "stickers_tags", ["tag_id"], :name => "index_stickers_tags_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
