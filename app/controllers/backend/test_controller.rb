# params[:start_date]
# params[:end_date]
# params[:start_time]
# params[:end_time]
# params[:people]

# # 枚舉器型態，可印每一個
# Date.new(2022, 02, 01).upto(Date.new(2022, 02, 15)) do |date|
#   p date
# end

# # Tue, 01 Feb 2022..Wed, 15 Feb 2012???
# (Date.new(2022, 02, 01)..Date.new(2012, 02, 15)).each do |date|
#   p date
# end

# # 還沒測試
# arr = (‘2009-01-02’…‘2009-01-30’).select {|x| Date.parse(x) rescue nil}

# # .wday

# OpenDate.create(availible_date: "19 Jan 2022").availible_date.wday

# .wday


# # 要存入的open_date

# dno = Dish.first.id
# dno.upto(dno+10) do |n|
#   d3 << OpenDate.new(dish_id: "#{n+193}")
# end

# OpenDate.import d3

# books = []
# 11.times do |i|
#   d3 << OpenDate.new(dish_id: "#{i}")
# end
# OpenDate.import d3


# d2 = Date.new(2022, 02, 01).upto(Date.new(2022, 02, 15))
# eday = [6,0]
# d3 = d2.select {|k| eday.exclude?(k.wday)}
# d4 = d3.collect { |n| n.to_s }

# book = OpenDate.create! dish_id: 193, availible_date:
# book.availible_date = d3
# book.published_at = Time.now


# d5 = ["2022-01-16"]

# dno = Dish.first.id
# 3.times do
#   d4 << OpenDate.new(dish_id: dno)
# end
# OpenDate.import d4

# columns = [ :dish_id, :availible_date ]
# values = [ [193, "2022-01-16"], [193, "2022-01-17"]]

# OpenDate.import columns, values

# d3.each{ |d5| d5.attributes}


# d3.size

# d4 = d3.collect { |n| n.to_s }

# d3.map { }

# /{a/}

# Store.create([
#               { name: 'Viktor' },
#               { name: 'Fleur' }
#               ])

# d3.size.do
#   OpenDate.create(availible_date: h)
# end

# # 要存入的時間

# st = Date.today.to_time
# et = st+2.hour
# interval = (et.to_i - st.to_i)/1800
# t_array = []

# until st > et
#   t_array.push st
#   st = st+1800
# end

# ccc = [[a, b]]

# h1 = {"availible_date"=>"item 1", "availible_date"=>"item 2"}

# h2 = [{availible_date: "item 1"}, {availible_date: "item 2"}]

# h2 = [{availible_date: "item 1"}, {availible_date: "item 2"}]

# Store.create([
#               { name: 'Viktor' },
#               { name: 'Fleur' }
#               ])

# n2 = [{name: 'item 1'}, {name: 'item 2'}]


# d2 = Date.new(2022, 02, 01).upto(Date.new(2022, 02, 15))
# eday = [6,0]
# d3 = d2.select {|k| eday.exclude?(k.wday)}
# d4 = d3.collect { |n| n.to_s }

# d2 = Date.new(2022, 02, 01).upto(Date.new(2022, 02, 03))
# eday = [6,0]
# d3 = d2.select {|k| eday.exclude?(k.wday)}
# d4 = d3.collect { |n| n.to_s }


# d4 = ["2022-02-01", "2022-02-02", "2022-02-03"]
# d_size = d4.size
# d4.each do |date|
#   a1 = Array.new(d_size) { OpenDate.new(dish_id: 193, availible_date: date) }
# end

# d4 = ["2022-02-01", "2022-02-02", "2022-02-03"]


## 正式區

params[:start_date] = 1
params[:start_date] = 2022-02-01
params[:end_date] = 2022-02-03
params[:start_time]
params[:end_time]
params[:people]

start_date = params[:start_date] = 2022-02-01
end_date = params[:end_date]
start_time = params[:start_time]
end_time = params[:end_time]
seat_capacity = params[:people]

# 處理dish 的opendate 日期
date_range = Date.new(2022, 02, 01).upto(Date.new(2022, 02, 02))
excluded_days = [6,0]
date_range = date_range.select {|n| excluded_days.exclude?(n.wday)}
date_range = date_range.collect { |n| n.to_s }

# ["2022-02-01", "2022-02-02", "2022-02-03", "2022-02-04", "2022-02-07", "2022-02-08", "2022-02-09", "2022-02-10", "2022-02-11", "2022-02-14", "2022-02-15"]
# p date_range

opendate_attributes = []
date_range.each do |date|
  opendate_attributes << ({ availible_date: date, dish_id: 193 })
end
open_date_ids = OpenDate.create opendate_attributes

# 一大包資料
# p open_date_ids

if open_date_ids.present?

  open_date_ids_array = []

  open_date_ids.each do |ids|
    open_date_ids_array << ids.id
  end

end

# [157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167]
# p open_date_ids_array

# 處理opendate 的offer 時間和人數
seat_capacity = 20
start_time = Date.today.to_time
end_time = start_time+2.hour
time_interval = (end_time.to_i - start_time.to_i)/1800
time_array = []
seat_capacity = (seat_capacity.to_i / (time_interval.to_i+1))

until start_time > end_time
  time_array << start_time
  start_time = start_time+1800
end

# p time_array

# [157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167]
# p open_date_ids_array

# date_range.size
# open_date_ids_array
# time_array

offer_attributes = []
open_date_ids_array.each do |date_id|
  time_array.each do |av_time|
      offer_attributes << ({ open_date_id: date_id, availible_time: av_time, capacity: seat_capacity
      })
  end
end
offer_result = Offer.create offer_attributes
pp offer_result




def add_temp
  opendate_attributes = []
  d4.each do |date|
    opendate_attributes <<({ :availible_date => date, :dish_id => 193 })
  end
  OpenDate.create opendate_attributes
end
