RSpec.describe SMSApi do
  describe '#configure' do
    after(:each) { SMSApi.reset }

    it 'is empty be default' do
      expect(SMSApi.configuration.username).to be(nil)
      expect(SMSApi.configuration.password).to be(nil)
    end

    it 'holds settings' do
      SMSApi.configure do |config|
        config.username = 'what_a_username'
        config.password = 'what_a_secret'
      end

      expect(SMSApi.configuration.username).to eq('what_a_username')
      expect(SMSApi.configuration.password).to eq('what_a_secret')
    end
  end

  describe '#reset' do
    it 'resets configuration' do
      SMSApi.configure do |config|
        config.username = 'what_a_username'
        config.password = 'what_a_secret'
      end

      SMSApi.reset

      expect(SMSApi.configuration.username).to be(nil)
      expect(SMSApi.configuration.password).to be(nil)
    end
  end

  it 'has a version number' do
    expect(SMSApi::VERSION).not_to be nil
  end
end
