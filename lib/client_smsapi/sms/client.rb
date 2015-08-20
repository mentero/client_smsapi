module SMSApi
  module SMS
    class Client
      attr_accessor :test_mode

      SERVERS = ['https://api.smsapi.pl', 'https://api2.smsapi.pl/sms.do']

      include HTTParty
      base_uri SERVERS.first

      def initialize(test_mode: false)
        @test_mode = test_mode
      end

      def send_message
        unless test_mode
          response = send_real_message
        else
          response = send_test_message
        end

        parse_response(response)
      end

      def parse_response(response)
        if response.body.start_with?('OK:')
          'OK'
        elsif response.body.start_with?('ERROR:')
          code = response.body.match(/ERROR:(?<code>.*)/)[:code].to_i
          SMSApi::SMS::Error.new(code)
        else
          SMSApi::SMS::Error.new
        end
      end

      def send_real_message
        self.class.post('/sms.do', query: params)
      end

      def send_test_message
        self.class.post('/sms.do', query: params.merge(test: 1))
      end

      def params
        {
          username: SMSApi.configuration.username,
          password: SMSApi.configuration.password,
          from: 'Eco',
          to: 48_505_735_444,
          message: 'Test'
        }
      end
    end
  end
end
