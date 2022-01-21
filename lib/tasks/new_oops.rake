namespace :db do
  require 'faker'
  desc "產生假分店-方案-時段-時間"
  task :new_oops => :environment do

    # 產生假分店1: 先建立各種food_type
    comp = Company.last
    5.times do
      comp.stores.create(name: Faker::Restaurant.name,
                        food_type: (0..10).to_a.sample,
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        intro: Faker::Restaurant.description
                        )
    end

  # # 產生假分店: 根據food_type 塞假照片
  #   s0 = Store.where(food_type: 0)
  #   if s0.present?
  #     s0.each do
  #       s0.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,chinese"})
  #     end
  #   end
  #   s1 = Store.where(food_type: 1)
  #   if s1.present?
  #     s1.each do
  #       s1.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,japanese"})
  #     end
  #   end
  #   s2 = Store.where(food_type: 2)
  #   if s2.present?
  #     s2.each do
  #       s2.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,korean"})
  #     end
  #   end
  #   s3 = Store.where(food_type: 3)
  #   if s3.present?
  #     s3.each do
  #       s3.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,indian"})
  #     end
  #   end
  #   s4 = Store.where(food_type: 4)
  #   if s4.present?
  #     s4.each do
  #       s4.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,italian"})
  #     end
  #   end
  #   s5 = Store.where(food_type: 5)
  #   if s5.present?
  #     s5.each do
  #       s5.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,british"})
  #     end
  #   end
  #   s6 = Store.where(food_type: 6)
  #   if s6.present?
  #     s6.each do
  #       s6.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,american"})
  #     end
  #   end
  #   s7 = Store.where(food_type: 7)
  #   if s7.present?
  #     s7.each do
  #       s7.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,french"})
  #     end
  #   end
  #   s8 = Store.where(food_type: 8)
  #   if s8.present?
  #     s8.each do
  #       s8.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,germany"})
  #     end
  #   end
  #   s9 = Store.where(food_type: 9)
  #   if s9.present?
  #     s9.each do
  #       s9.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,mexican"})
  #     end
  #   end
  #   s10 = Store.where(food_type: 10)
  #   if s10.present?
  #     s10.each do
  #       s10.update({remote_image_url: "https://loremflickr.com/300/200/restaurant"})
  #     end
  #   end

    # # 產生假方案
      sto = Store.all.sample
      2.times do |i|
        sto.dishes.create(name: Faker::Food.ethnic_category,
                          price: (100..1000).to_a.sample,
                          status: 1,
                          intro: Faker::Food.description)
      end

    # 產生假時段
      date_pick = []
      nob = 1
      while nob < 5
        date_pick << (Time.now+nob.day).to_date
      nob = nob + 1
      end

      dis = Dish.all.sample
      1.times do |i|
        dis.open_dates.create(availible_date: date_pick.sample)
      end

    # 產生假餐券
    time_pick = ["11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00"]
    opend = OpenDate.all.sample
    1.times do |i|
      opend.offers.create(availible_time: time_pick.sample,
                          capacity: (1..10).to_a.sample)
    end
  end
end