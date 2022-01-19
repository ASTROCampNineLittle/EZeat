namespace :db do
  require 'faker'
  desc "產生假分店-方案-時段-時間"
  task :new_oops => :environment do
      dish = Dish.find(params:[:id])
      d1 = dish.where(date: ""%7 <2)
      d1.each do
        d1.update(time: "13:00");
      end
    end
  end