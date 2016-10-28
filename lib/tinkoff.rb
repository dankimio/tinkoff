require 'httparty'
require 'active_support/all'
require 'tinkoff/base'
require 'tinkoff/client'
require 'tinkoff/payment'
require 'tinkoff/version'

module Tinkoff
  include ActiveSupport::Configurable
end
