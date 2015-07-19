module SMSApi
  module Validators
    class PhoneNumberValidator
      def self.valid_number?(number)
        new(number).valid?
      end

      attr_reader :number
      def initialize(number)
        @number = number
      end

      def valid?
        true
      end
    end
  end
end
