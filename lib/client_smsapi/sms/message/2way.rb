module SMSApi
  module SMS
    class Message
      class TwoWay < SMSApi::SMS::Message
        FROM = '2way'.freeze

        def initialize(to:, from: FROM, body:)
          super

          @from = FROM
        end
      end
    end
  end
end
