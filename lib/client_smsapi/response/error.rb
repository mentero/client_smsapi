require 'yaml'

module SMSApi
  class Response
    class Error < SMSApi::Response
      attr_reader :code, :message

      def initialize(code = nil)
        @code      = code
        @message   = MESSAGES.fetch(code, 'Unknown error')

        super(:error)
      end

      def exception
        StandardError.new("[CODE: #{code}] #{message}")
      end

      MESSAGES = YAML.load_file('lib/client_smsapi/error/messages.yml')['error'].freeze
    end
  end
end
