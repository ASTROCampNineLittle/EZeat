namespace :db do
  desc "產生假分店-方案-時段-時間"
  task :new_oops => :environment do

    # 產生假公司
    us = User.first
    1.times do |i|
      us.create_company(name: Faker::Restaurant.name,
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        manager_name: Faker::Games::Pokemon
                        )
    end

    # 產生假分店
    com = Company.first
    5.times do |i|
      com.stores.create(name: Faker::Restaurant.name,
                        food_type: (1..10).to_a.sample,
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        intro: Faker::Restaurant.description
                        )
    end

    # 產生假方案
    sto = Store.first
    5.times do |i|
      sto.dishes.create(name: Faker::Food.ethnic_category,
                      price: (100..1000).to_a.sample,
                      status: 1,
                      intro: Faker::Food.description)
    end

    # 產生假時段
      dis = Dish.first
      5.times do |i|
      dis.open_dates.create(availible_date: Time.now)
    end

    # 產生假餐券
      opend = OpenDate.first
      5.times do |i|
      opend.offers.create(availible_time: Time.now,
                          capacity: (1..10).to_a.sample)
    end
  end
end