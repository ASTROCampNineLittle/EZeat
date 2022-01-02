namespace :db do
  desc "產生假分店"
  task :new_companies => :environment do
    u = Company.random
    5.times do |i|
      u.companies.create(name: Faker::Name.name)
    end
  end
end
