namespace :db do
  desc "驗證所有存在會員"
  task :auth_users => :environment do
      User.all.each do |user|
        user.confirm!
    end
  end
end

