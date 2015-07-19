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
        !!number.to_s.match(/^(48)?(\d){9}$/)
      end
    end
  end
end
