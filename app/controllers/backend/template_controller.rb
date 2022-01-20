class Backend::TemplateController < ApplicationController
  def new
    @dish = Dish.new
    @opendate = OpenDate.new
    @offer = Offer.new

    # 儲存當前dish id
    @dish_id = Dish.find(params[:dish_id])

    # 先計算要扣掉的星期
    excluded_days = []
    excluded_days += [params[:exclude_sun].to_i,
                      params[:exclude_mon].to_i,
                      params[:exclude_tue].to_i,
                      params[:exclude_wen].to_i,
                      params[:exclude_thr].to_i,
                      params[:exclude_fri].to_i,
                      params[:exclude_sat].to_i]
    excluded_days.delete(8)

    # 設定各個區域變數為params
    start_date = params[:start_date]
    end_date = params[:end_date]
    # start_time = (params["start_time(4i)"]+":"+params["start_time(5i)"]).to_time
    # end_time = (params["end_time(4i)"]+":"+params["end_time(5i)"]).to_time
    # seat_capacity = params[:people_amount]

    # 處理dish 的opendate 日期
    date_range = (Date.parse(start_date)).upto(Date.parse(end_date))
    date_range = date_range.select {|n| excluded_days.exclude?(n.wday)}
    date_range = date_range.collect { |n| n.to_s }

    # 根據dish_id、選擇的日期天數轉成可用來create 的params
    @opendate_attributes = []
    date_range.each do |date|
    @opendate_attributes << date
    end

    # 建立數筆opendate，並屬於該dish
    # 將上方建立的數筆open_date_id 存下，以便下方的offers 能取用
    # if @opendate_attributes.present?
    #   open_date_ids_array = []

    #   @opendate.each do |ids|
    #     open_date_ids_array << ids.id
    #   end
    # end

    # 處理offer 時間和人數
    # seat_capacity = params[:people_amount]
    # time_interval = (end_time.to_i - start_time.to_i)/1800
    # @seat_capacity = (seat_capacity.to_f / (time_interval.to_f+1.0)).ceil
    # time_array = []

    # 每30 分鐘寫入一筆可訂位人數
    # until start_time > end_time
    #   time_array << start_time
    #   start_time = start_time+1800
    # end

    # time_array = time_array.collect { |n| n.strftime("%H:%M") }

    # p time_array
    # p open_date_ids_array

    # 根據open_date_id、選擇的時間、人數轉成可用來create 的params
    # @offer_attributes = []
    # open_date_ids_array.each do |date_id|
    # time_array.each do |av_time|
    # @offer_attributes << ({ availible_time: av_time, capacity: seat_capacity})
    # end
    # time_array.each do |av_time|
    #   @offer_attributes <<  av_time
    #   end
    # end

  end

  # 如果儲存成功則轉跳
  def create
    @dish = Dish.find(params[:dish_id])
    @opendate = @dish.update(opendate_params)
    # offers = @dish.open_dates.offers.update(offer_params)
    redirect_to backend_dish_open_dates_path(params[:dish_id])
  end

  private
  def opendate_params
    params.require(:dish).permit(open_dates_attributes: [:id, :availible_date])
  end

  def offer_params
    params.require(:dish).require(:offers).permit(:availible_time, :capacity)
  end
end