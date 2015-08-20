module SMSApi
  module Validators
    class MessageBodyValidator
      def self.valid_body?(body)
        new(body).valid?
      end

      attr_reader :body
      def initialize(body)
        @body = body
      end

      def valid?
        !body.empty?
      end
    end
  end
end
