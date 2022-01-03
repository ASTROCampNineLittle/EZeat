namespace :db do
  desc "產生假分店"
  task :new_companies => :environment do
    u = User.random
    5.times do |i|
      u.company.create(name: Faker::Restaurant.name,
                        address: Faker::Address.street_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        manager_name: Faker::Name.name)
    end
  end
end
