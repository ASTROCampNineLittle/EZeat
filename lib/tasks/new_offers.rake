namespace :db do
  desc "產生假方案"
  task :new_dishes => :environment do

    s = Store.first
    5.times do |i|
      s.dishes.create(availible_time: Faker::Time.backward(days: 14, period: :evening)

      create_table "offers", force: :cascade do |t|
        t.bigint "open_date_id", null: false
        t.time "availible_time"
        t.integer "capacity"
        t.datetime "created_at", precision: 6, null: false
        t.datetime "updated_at", precision: 6, null: false
        t.index ["open_date_id"], name: "index_offers_on_open_date_id"
                        )
    end
  end
end

