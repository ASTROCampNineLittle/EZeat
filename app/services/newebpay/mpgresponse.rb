module Newebpay
  class Mpgresponse
    # 使用 attr_reader 可以更方便取用這些資訊
    attr_reader :status, :message, :result, :order_number, :newebpay_number, :newebpay_amount, :newebpay_time, :newebpay_card6no

    def initialize(params)
      # 解密需要 key 跟 Hash 來解開
      @key = ENV["newebpay_key"] 
      @iv  = ENV["newebpay_iv"]
      
      # 將藍新回傳的 params 丟到 decrypy 做解密
      response = decrypy(params)
      @status = response["Status"]
      @message = response["Message"]
      @order_number = response.dig("Result", "MerchantOrderNo")
      @newebpay_number = response.dig("Result", "TradeNo")
      @newebpay_amount = response.dig("Result", "Amt")
      @newebpay_time = response.dig("Result", "PayTime")
      @newebpay_card6no = response.dig("Result", "Card6No")
    end

    private
      # AES 解密
      def decrypy(encrypted_data)
        encrypted_data = [encrypted_data].pack('H*')
        decipher = OpenSSL::Cipher::AES256.new(:CBC)
        decipher.decrypt
        decipher.padding = 0
        decipher.key = @key
        decipher.iv = @iv
        data = decipher.update(encrypted_data) + decipher.final
        raw_data = strippadding(data)
        JSON.parse(raw_data)
      end

      def strippadding(data)
        last_word = data[-1].ord
        last_word_chr = last_word.chr
        string_match = /#{last_word_chr}{#{last_word}}/ =~ data
        if !string_match.nil?
          data[0, string_match]
        else
          false
        end
      end
  end
end
