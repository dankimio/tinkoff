module Tinkoff
  class Response
    attr_reader :success, :error_code, :message, :details, :amount,
                :merchant_email, :merchant_name, :order_id, :payment_id, :tran_date

    def initialize(params)
      @success = params['Success']
      @error_code = params['ErrorCode']
      @message = params['Message']
      @details = params['Details']
      @amount = params['Amount']
      @merchant_email = params['MerchantEmail']
      @merchant_name = params['MerchantName']
      @order_id = params['OrderId']
      @payment_id = params['PaymentId']
      @tran_date = params['TranDate']
    end
  end
end
