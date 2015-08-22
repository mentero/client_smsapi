module SMSApi
  module SMS
    class Message
      attr_reader :recipient, :body

      def initialize(recipient:, body:)
        @recipient = recipient
        @body      = body
      end

      def valid?
        @valid ||= begin
          Validators::MessageBodyValidator.valid_body?(body)
          Validators::PhoneNumberValidator.valid_number?(recipient)
        end
      end

      def to_params
        @params ||= {
          from: 'Eco',
          to: recipient.to_s,
          message: body
        }
      end
    end
  end
end
