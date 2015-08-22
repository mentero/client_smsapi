module SMSApi
  module SMS
    class Error
      attr_reader :code, :message

      def initialize(code = nil)
        @code      = code
        @message   = MESSAGES.fetch(code, 'Unknown error')
      end

      def exception
        StandardError.new("[CODE: #{code}] #{message}")
      end

      MESSAGES = {
        11  => 'Zbyt długa lub brak wiadomości lub ustawiono parametr nounicode i pojawiły się znaki specjalne w wiadomości. Dla wysyłki VMS błąd oznacza brak pliku WAV lub treści TTS.',
        101 => 'Niepoprawne lub brak danych autoryzacji.'
      }
    end
  end
end
