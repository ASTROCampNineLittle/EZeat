namespace :db do
  desc "產生假會員"
  task :new_users => :environment do
    5.times do |i|
      User.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  tel: Faker::PhoneNumber.cell_phone)
    end
  end
end
