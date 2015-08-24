RSpec.describe SMSApi::SMS::Message::Pro do
  subject { described_class.new(to: 48_702_702_702, body: 'Test', from: 'Mentero') }

  it 'has its readers set up' do
    expect(subject.to).to eq(48_702_702_702)
    expect(subject.from).to eq('Mentero')
    expect(subject.body).to eq('Test')
  end

  describe '.to_params' do
    it 'returns correct hash' do
      expect(subject.to_params).to eq(from: 'Mentero', to: '48702702702', message: 'Test')
    end
  end
end
