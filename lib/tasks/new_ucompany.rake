namespace :db do
  desc "產生假會員-公司"
  task :new_ucompany => :environment do
    1.times do |i|
      User.create(name: Faker::Games::Pokemon.name,
                  email: "pica@p#{i}",
                  password: '111',
                  password_confirmation: '111',
                  tel: Faker::PhoneNumber.cell_phone,
                  gender: (0..2).to_a.sample
                  )
    end

    # 產生假公司
    us = User.first
    1.times do |i|
      us.create_company(name: Faker::Restaurant.name,
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        manager_name: Faker::Games::Pokemon
                        )
    end
  end
end