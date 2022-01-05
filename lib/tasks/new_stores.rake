namespace :db do
  desc "產生假分店"
  task :new_stores => :environment do
    c = Company.random
    5.times do |i|
      c.stores.create(name: Faker::Restaurant.name,
                        food_type: (1..10).to_a.sample,
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        # email: Faker::Internet.free_email,
                        intro: Faker::Restaurant.description
                        )
    end
  end
end