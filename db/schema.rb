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

ActiveRecord::Schema.define(:version => 20111030001941) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.integer  "room_id"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.boolean  "gmaps"
    t.string   "city"
  end

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_read_timestamp"
  end

  create_table "questions", :force => true do |t|
    t.integer  "quiz_id"
    t.string   "prompt"
    t.string   "choice_1"
    t.string   "choice_2"
    t.string   "choice_3"
    t.string   "choice_4"
    t.string   "choice_5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_choices"
  end

  create_table "questions_traits", :id => false, :force => true do |t|
    t.integer  "question_id"
    t.integer  "trait_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_attempt_responses", :force => true do |t|
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_attempt_id"
  end

  create_table "quiz_attempts", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roommates", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "rent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "desired_gender"
    t.integer  "max_renters"
    t.integer  "age"
    t.string   "sexual_orientation"
    t.boolean  "has_pets"
    t.boolean  "willing_to_live_with_pets"
    t.boolean  "willing_to_live_with_smoker"
    t.boolean  "does_smoke"
    t.string   "desired_living_area"
    t.integer  "user_id"
    t.date     "desired_move_in_date"
  end

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.integer  "price"
    t.text     "description"
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "desired_length_of_stay_number"
    t.string   "desired_gender"
    t.boolean  "couples_allowed"
    t.boolean  "smoking_on_premise"
    t.boolean  "pets_on_premise"
    t.boolean  "amenities_ac"
    t.boolean  "amenities_heater"
    t.boolean  "amenities_cable_tv"
    t.boolean  "amenities_internet"
    t.boolean  "amenities_kitchen"
    t.boolean  "amenities_washer"
    t.boolean  "amenities_backyard"
    t.boolean  "amenities_balcony"
    t.boolean  "amenities_rooftop"
    t.boolean  "amenities_elevator"
    t.boolean  "smoking_allowed"
    t.boolean  "pets_allowed"
    t.string   "price_per_week_month"
    t.string   "desired_length_of_stay_week_month"
    t.string   "desired_length_of_stay_more_less"
    t.string   "contact_info"
    t.date     "desired_move_in_date"
  end

  create_table "traits", :force => true do |t|
    t.string   "name"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

end
