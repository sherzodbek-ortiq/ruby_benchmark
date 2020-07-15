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

ActiveRecord::Schema.define(version: 2020_07_15_011742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benchmark_infos", force: :cascade do |t|
    t.float "average_execution_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file_name"
    t.string "error_message"
    t.float "median_execution_time"
    t.float "min_execution_time"
    t.float "max_execution_time"
  end

end
