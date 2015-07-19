require_relative 'sms/message'
require_relative 'sms/client'

module SMSApi
  module SMS
    SERVERS = ['https://api.smsapi.pl/sms.do', 'https://api2.smsapi.pl/sms.do']
  end
end
