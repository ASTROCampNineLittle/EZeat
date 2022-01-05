namespace :db do
  desc "產生假會員"
  task :new_users => :environment do
    5.times do |i|
      User.create(name: Faker::Games::Pokemon,
                  email: "pica@p#{i}",
                  password: '111',
                  password_confirmation: '111',
                  tel: Faker::PhoneNumber.cell_phone,
                  gender: (0..1).to_a.sample
                  )
    end
  end
end