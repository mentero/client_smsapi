RSpec.describe SMSApi::SMS::Client do
  subject { described_class.new(test_mode: true) }

  before(:all) do
    SMSApi.configure do |config|
      config.username = 'xmentero@gmail.com'
      config.password = '22071cbad7dbb5d086984fb1d58958b3'
    end
  end

  after(:all) { SMSApi.reset }

  it 'sends sms' do
    subject.send_message
  end
end
