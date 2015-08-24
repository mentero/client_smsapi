module SMSApi
  module SMS
    class Message
      attr_reader :to, :body

      def initialize(to:, body:)
        @to   = to
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
          from: 'Eco',
          to: to.to_s,
          message: body
        }
      end
    end
  end
end
