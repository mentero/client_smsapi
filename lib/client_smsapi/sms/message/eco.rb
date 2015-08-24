module SMSApi
  module SMS
    class Message
      class Eco < SMSApi::SMS::Message
        FROM = 'Eco'.freeze

        def initialize(to:, from: FROM, body:)
          super

          @from = FROM
        end
      end
    end
  end
end
