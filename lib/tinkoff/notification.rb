module Tinkoff
  class Notification
    attr_reader :terminal_key, :order_id, :success, :status, :payment_id,
                :error_code, :amount, :rebill_id, :card_id, :pan, :token

    def initialize(params)
      @terminal_key = params['TerminalKey']
      @order_id = params['OrderId']
      @success = params['Success'] == 'true'
      @status = params['Status']
      @payment_id = params['PaymentId'].to_i
      @error_code = params['ErrorCode']
      @amount = params['Amount'].to_i
      @rebill_id = params['RebillId'].to_i
      @card_id = params['CardId'].to_i
      @pan = params['Pan']
      @token = params['Token']
    end

    def success?
      @success
    end

    def failure?
      !@success
    end
  end
end
