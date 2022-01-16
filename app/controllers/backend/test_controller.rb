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



