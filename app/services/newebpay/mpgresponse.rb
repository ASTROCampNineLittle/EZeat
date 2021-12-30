module Newebpay
  class Mpgresponse
    # 使用 attr_reader 可以更方便取用這些資訊
    attr_reader :status, :message, :result, :order_no, :trans_no, :amt, :pay_time, :card_last4num

    def initialize(params)
      # 解密需要 key 跟 Hash 來解開
      @key = ENV["newebpay_key"] 
      @iv  = ENV["newebpay_iv"]
      # 將藍新回傳的 params 丟到 decrypy 做解密
      response = decrypy(params)
      @status = response['Status']
      @message = response['Message']
      @result = response['Result']
      @order_no = @result["MerchantOrderNo"]
      @trade_no = @result["TradeNo"]
      @amt = @result["Amt"]
      @pay_time = @result["PayTime"]  
      @card_last4num = @result["Card4No"]
    end

    def success?()
      @status === 'SUCCESS'
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
        last_word_chr = slast.chr
        string_match = /#{slastc}{#{slast}}/ =~ data
        debugger
        if !string_match.nil?
          data[0, string_match]
        else
          false
        end
      end
  end
end
