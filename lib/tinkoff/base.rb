module Tinkoff
  class Base
    BASE_URL = 'https://securepay.tinkoff.ru/rest/'

    def self.perform_request(url, params)
      params = params.merge(default_params)
      response = HTTParty.post(BASE_URL + url, body: params, format: :json).parsed_response
      Tinkoff::Payment.new(response)
    end
    private_class_method :perform_request

    def self.default_params
      {
        TerminalKey: Tinkoff.config.terminal_key,
        Token: Tinkoff.config.token
      }
    end
    private_class_method :default_params
  end
end
