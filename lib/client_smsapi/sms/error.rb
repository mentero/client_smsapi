module SMSApi
  module SMS
    class Error
      attr_reader :code, :message

      def initialize(code = nil)
        @code      = code
        @message   = MESSAGES.fetch(code, 'Unknown error')
      end

      MESSAGES = {
        101 => 'Niepoprawne lub brak danych autoryzacji.'
      }
    end
  end
end
