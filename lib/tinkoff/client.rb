module Tinkoff
  class Client < Tinkoff::Base
    # Инициирует платежную сессию и регистрирует заказ в системе Банка
    def self.init(amount, order_id, data, params = {})
      params = params.merge(Amount: amount, OrderId: order_id, DATA: prepare_data(data))
      perform_request('Init', params)
    end

    # Данный метод используется, если продавец обладает сертификацией PCI DSS
    # и использует свою собственную платежную форму вместо формы банка.
    # TODO: Implement
    def self.finish_authorize(params = {})
      perform_request('FinishAuthorize', params)
    end

    # Подтверждает платеж и осуществляет списание заблокированных ранее денежных средств
    def self.confirm(payment_id, params = {})
      params = params.merge(PaymentId: payment_id)
      perform_request('Confirm', params)
    end

    # Осуществляет рекуррентный (повторный) платеж — безакцептное списание денежных средств
    # со счета банковской карты Покупателя
    def self.charge(payment_id, rebill_id, params = {})
      params = params.merge(PaymentId: payment_id, RebillId: rebill_id)
      perform_request('Charge', params)
    end

    # Отменяет платежную сессию
    def self.cancel(payment_id, params = {})
      params = params.merge(PaymentId: payment_id)
      perform_request('Cancel', params)
    end

    # Возвращает текуший статус платежа
    def self.state(payment_id, params = {})
      params = params.merge(PaymentId: payment_id)
      perform_request('GetState', params)
    end

    # Ключ=значение дополнительных параметров через “|”, например Email=a@test.ru|Phone=+71234567890
    def self.prepare_data(data)
      data.to_query.tr('&', '|')
    end
    private_class_method :prepare_data
  end
end
