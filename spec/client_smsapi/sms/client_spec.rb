RSpec.describe SMSApi::SMS::Client do
  subject { described_class.new(test_mode: true) }

  it 'holds serverlist' do
    expect(SMSApi::SMS::Client::SERVERS).to be_a(Array)
  end

  it 'we have 2 servers for now' do
    expect(SMSApi::SMS::Client::SERVERS.count).to eq(2)
  end

  describe '.send_message' do
    let(:message) { SMSApi::SMS::Message::Eco.new(to: 48_505_735_444, body: 'test') }

    before(:all) do
      SMSApi.configure do |config|
        config.username = 'xmentero@gmail.com'
        config.password = '22071cbad7dbb5d086984fb1d58958b3'
      end
    end

    after(:all) { SMSApi.reset }

    it 'sends sms' do
      subject.send_message(message)
    end
  end
end
