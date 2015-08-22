require 'client_smsapi/version'
require 'client_smsapi/error'
require 'client_smsapi/configuration'
require 'client_smsapi/validators'

require 'httparty'

require 'client_smsapi/sms'

module SMSApi
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
