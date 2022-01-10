module Newebpay
  class Mpgpost
    # 4000-2211-1111-1111（一次付清測試卡號）
    attr_accessor :info

    def initialize( merchant_id: nil , key: nil, iv: nil)
      @key = key || ENV["newebpay_key"]
      @iv  = iv || ENV["newebpay_iv"]
      @merchant_id = merchant_id || ENV["newebpay_merchant_id"]
      @info = {}
      set_info()
    end

    def form_info
      {
        MerchantID: @merchant_id,
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: "1.5"
      }
    end

    private

    def ezeat_random_number
      ezeat = "EZeat"
      timestamp = Time.now.strftime("%m%d%H%M")
      ezeat_time = ezeat.insert(-1,timestamp)
      number = rand(0...999).to_s.rjust(3, '0')
      return ezeat_time_random = ezeat_time.insert(-1,number)
    end

    def set_info()
      @info[:MerchantID] = @merchant_id
      @info[:MerchantOrderNo] = ezeat_random_number.to_s
      @info[:Amt] = 100
      @info[:ItemDesc] = "5x餐卷好好吃"
      @info[:Email] = "dreamorange830@gmail.com"
      # @info[:Amt] = project.price
      # @info[:ItemDesc] = project.name
      # @info[:Email] = user.email
      @info[:TimeStamp] = Time.now.to_i
      @info[:RespondType] = "JSON"
      @info[:Version] = "1.5"
      @info[:ReturnURL] = "http://localhost:3000/payments/:payment_id/confirm"
      # id: params[:id], order: 123 => project/3&order=123
      @info[:NotifyURL] = ""
      @info[:LoginType] = 0
      @info[:CREDIT] =  1
      @info[:VACC] = 0
      # ----選填區-----
      # @info[:ClientBackURL] =  "返回上一頁的網址"
      # @info[:OrderComment]  =  "字數上限300字,可以帶資料庫的餐卷描述"
      # ----選填區-----
    end

    def trade_info
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      sha256_encode(@key, @iv, trade_info)
    end

    def url_encoded_query_string
      URI.encode_www_form(info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack('H*').first
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
  end
end