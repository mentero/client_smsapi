module SMSApi
  module SMS
    class Message
      attr_reader :recipient, :message

      def initialize(recipient:, message:)
        @recipient = recipient
        @message   = message
      end

      def valid?
      end
    end
  end
end
