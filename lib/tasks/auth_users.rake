namespace :db do
  desc "驗證所有已存在會員"
  task :auth_users => :environment do
    User.all.each do |user|
      user.confirm
      # user.send_confirmation_instructions
    end
  end
end