namespace :db do
  desc "產生假分店-方案-時段-時間 第2版"
  task :new_ouch => :environment do

    4.times do |n|
      Dish.create(name: Faker::Food.ethnic_category,
                  price: (100..1000).to_a.sample,
                  status: 1,
                  intro: Faker::Food.description,
                  store_id: n)
    end

    dno = Dish.first.id
    dno.upto(dno+3) do |n|
      OpenDate.create(availible_date: Time.now.next_day.to_date,
                      dish_id: n)
    end

    ono = OpenDate.first.id
    ono.upto(ono+3) do |n|
      Offer.create(availible_time: Time.now.next_day.to_formatted_s(:time),
                  capacity: (1..10).to_a.sample,
                  open_date_id: n)
    end
  end
end