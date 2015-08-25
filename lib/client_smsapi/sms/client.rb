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

      def send_message(message, additional_params = {})
        params = build_params(message, additional_params)
        response = self.class.post('/sms.do', query: params)
        parse_response(response)
      end

      def send_message!(message)
        response = send_message(message)
        fail response if response.is_a? SMSApi::Response::Error
        response
      end

      private

      def build_params(message, additional_params)
        base_params
          .merge(message.to_params)
          .merge(extra_params)
          .merge(additional_params)
      end

      def parse_response(response)
        if response.body.start_with?('OK:')
          Response::Regular.new(*response.split(':').drop(1))
        elsif response.body.start_with?('ERROR:')
          code = response.body.match(/ERROR:(?<code>.*)/)[:code].to_i
          Response::Error.new(code)
        else
          Response::Error.new
        end
      end

      def extra_params
        return @extra_params if @extra_params

        @extra_params = {}
        @extra_params[:test] = 1 if test_mode
        @extra_params
      end

      def base_params
        @base_params ||= {
          username: SMSApi.configuration.username,
          password: SMSApi.configuration.password,
          encoding: 'utf-8'
        }
      end
    end
  end
end
