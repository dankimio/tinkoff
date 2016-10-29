require 'httparty'
require 'active_support'
require 'active_support/core_ext/hash'
require 'tinkoff/base'
require 'tinkoff/client'
require 'tinkoff/payment'
require 'tinkoff/version'

module Tinkoff
  include ActiveSupport::Configurable
end
