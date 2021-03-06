# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_01_022517) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "refresh_token"
    t.index ["uid"], name: "index_accounts_on_uid", unique: true
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "administrators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "access_token"
    t.datetime "access_token_expire_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_token"], name: "index_administrators_on_access_token", unique: true
    t.index ["email"], name: "index_administrators_on_email", unique: true
  end

  create_table "apple_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "account_id"
    t.text "access_token"
    t.text "refresh_token"
    t.string "uid"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "checkins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "music_id", null: false
    t.string "comment"
    t.integer "user_id", null: false
    t.integer "place_id", null: false
    t.integer "checkin_type", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_checkins_on_discarded_at"
    t.index ["place_id"], name: "index_checkins_on_place_id"
    t.index ["user_id"], name: "index_checkins_on_user_id"
  end

  create_table "composers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_image_url"
  end

  create_table "event_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "lang"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
  end

  create_table "event_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "image_url"
    t.integer "height"
    t.integer "width"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "event_id"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "price"
    t.string "ticket_link"
    t.integer "place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foursquare_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "venue_id"
    t.string "name"
    t.string "address"
    t.decimal "latitude", precision: 20, scale: 17
    t.decimal "longitude", precision: 20, scale: 17
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_friday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_friday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "introduction_articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "place_id"
    t.bigint "magazine_id"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magazine_id", "place_id"], name: "index_introduction_articles_on_magazine_id_and_place_id", unique: true
    t.index ["magazine_id"], name: "index_introduction_articles_on_magazine_id"
    t.index ["place_id"], name: "index_introduction_articles_on_place_id"
  end

  create_table "key_words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "location_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name_ja"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "map_icon_url"
    t.string "color_code"
    t.string "icon_url"
    t.integer "order"
    t.index ["name_ja"], name: "index_location_types_on_name_ja", unique: true
  end

  create_table "log_recommend_locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "account_id"
    t.float "search_longitude"
    t.float "search_latitude"
    t.float "current_longitude"
    t.float "current_latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "log_recommend_id"
  end

  create_table "log_recommends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "log_redirect_app_pages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "log_search_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "account_id"
    t.string "spotify_music_id"
    t.string "title"
    t.string "song_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "log_recommend_id"
  end

  create_table "magazines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.string "logo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_magazines_on_title", unique: true
  end

  create_table "monday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_monday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_monday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "spotify_music_id"
    t.string "title"
    t.string "song_by"
    t.string "thumbnail_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spotify_music_id"], name: "index_musics_on_spotify_music_id", unique: true
  end

  create_table "place_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "lang"
    t.integer "place_id"
    t.string "address"
    t.text "description"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lang"], name: "index_place_details_on_lang"
    t.index ["place_id", "lang"], name: "index_place_details_on_place_id_and_lang", unique: true
    t.index ["place_id"], name: "index_place_details_on_place_id"
  end

  create_table "place_feature_parameters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.float "searched_music"
    t.float "favorite_music"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "played_music"
  end

  create_table "place_features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.float "valence"
    t.float "speechiness"
    t.float "tempo"
    t.float "instrumentalness"
    t.float "danceability"
    t.float "liveness"
    t.float "energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "mode"
  end

  create_table "place_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "image_url"
    t.integer "place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "width"
    t.integer "height"
  end

  create_table "place_key_words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "key_word_id"
  end

  create_table "place_location_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.integer "location_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "place_played_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "music_id"
    t.integer "place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "music_id"], name: "index_place_played_musics_on_place_id_and_music_id", unique: true
  end

  create_table "place_sub_location_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.integer "sub_location_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_place_sub_location_types_on_place_id"
    t.index ["sub_location_type_id"], name: "index_place_sub_location_types_on_sub_location_type_id"
  end

  create_table "placelist_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id", null: false
    t.integer "placelist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.index ["place_id"], name: "index_placelist_places_on_place_id"
    t.index ["placelist_id"], name: "index_placelist_places_on_placelist_id"
  end

  create_table "placelists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "composer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.string "code"
    t.boolean "is_published", default: true, null: false
    t.index ["code"], name: "index_placelists_on_code"
    t.index ["discarded_at"], name: "index_placelists_on_discarded_at"
    t.index ["is_published"], name: "index_placelists_on_is_published"
  end

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.string "google_place_id"
    t.string "address"
    t.text "description"
    t.string "phone_number"
    t.string "website_url"
    t.decimal "latitude", precision: 20, scale: 17
    t.decimal "longitude", precision: 20, scale: 17
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_level"
    t.boolean "is_visible", default: true
    t.string "twitter_url"
    t.string "instagram_url"
    t.string "facebook_url"
    t.string "placy_place_id", default: "", null: false
    t.index ["is_visible"], name: "index_places_on_is_visible"
  end

  create_table "recommend_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "music_id"
    t.float "valence"
    t.float "speechiness"
    t.float "tempo"
    t.float "instrumentalness"
    t.float "danceability"
    t.float "liveness"
    t.float "energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mode"
  end

  create_table "saturday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_saturday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_saturday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "searched_like_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_like_place_id"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searched_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_like_place_id"
    t.string "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "selected_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "music_id"
    t.text "description"
    t.integer "place_id"
    t.boolean "is_current", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "music_id"], name: "index_selected_musics_on_place_id_and_music_id", unique: true
  end

  create_table "sms_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spotify_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "refresh_token"
    t.text "access_token"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "spotify_user_id"
    t.string "email"
    t.index ["spotify_user_id"], name: "index_spotify_accounts_on_spotify_user_id", unique: true
  end

  create_table "spotify_external_urls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "spotify_account_id"
    t.string "url"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_location_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon_url"
    t.string "map_icon_url"
    t.bigint "location_type_id"
    t.index ["location_type_id"], name: "index_sub_location_types_on_location_type_id"
  end

  create_table "sunday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_sunday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_sunday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "thursday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_thursday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_thursday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "tuesday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_tuesday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_tuesday_opening_hours_on_place_id_and_start_at", unique: true
  end

  create_table "user_like_musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_current_like", default: true, null: false
    t.index ["user_id", "music_id"], name: "unique_user_id_spotify_music_id", unique: true
  end

  create_table "user_like_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.integer "like_place_id"
    t.integer "review_type", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_seed", default: false, null: false
    t.index ["like_place_id"], name: "index_user_like_places_on_like_place_id"
    t.index ["user_id", "like_place_id"], name: "index_user_like_places_on_user_id_and_like_place_id", unique: true
    t.index ["user_id"], name: "index_user_like_places_on_user_id"
  end

  create_table "user_placelists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.integer "placelist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "transaction_id"
    t.index ["transaction_id"], name: "index_user_placelists_on_transaction_id"
  end

  create_table "user_went_foursquare_places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "foursquare_place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "probability", precision: 20, scale: 17
    t.index ["foursquare_place_id"], name: "index_user_went_foursquare_places_on_foursquare_place_id"
    t.index ["user_id"], name: "index_user_went_foursquare_places_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "profile_image_url"
    t.string "bio"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sex", default: 0, null: false
    t.date "birthday"
    t.string "address"
    t.boolean "is_created_by_placy", default: false
  end

  create_table "wednesday_opening_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "place_id"
    t.string "start_at"
    t.string "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id", "end_at"], name: "index_wednesday_opening_hours_on_place_id_and_end_at", unique: true
    t.index ["place_id", "start_at"], name: "index_wednesday_opening_hours_on_place_id_and_start_at", unique: true
  end

  add_foreign_key "sub_location_types", "location_types"
end
