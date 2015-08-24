require_relative 'message/eco'
require_relative 'message/2way'
require_relative 'message/pro'

module SMSApi
  module SMS
    class Message
      attr_reader :to, :from, :body

      def initialize(to:, from:, body:)
        @to   = to
        @from = from
        @body = body
      end

      def valid?
        @valid ||= begin
          Validators::MessageBodyValidator.valid_body?(body)
          Validators::PhoneNumberValidator.valid_number?(to)
        end
      end

      def to_params
        @params ||= {
          from: from.to_s,
          to: to.to_s,
          message: body
        }
      end
    end
  end
end
