require 'yaml'

module SMSApi
  class Error
    attr_reader :code, :message

    def initialize(code = nil)
      @code      = code
      @message   = MESSAGES.fetch(code, 'Unknown error')
    end

    def exception
      StandardError.new("[CODE: #{code}] #{message}")
    end

    MESSAGES = YAML.load_file('lib/client_smsapi/error/messages.yml')['error'].freeze
  end
end
