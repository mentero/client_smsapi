RSpec.describe SMSApi::SMS::Message::TwoWay do
  subject { described_class.new(to: 48_702_702_702, body: 'Test') }

  it 'has its readers set up' do
    expect(subject.to).to eq(48_702_702_702)
    expect(subject.from).to eq('2way')
    expect(subject.body).to eq('Test')
  end

  describe '.to_params' do
    it 'returns correct hash' do
      expect(subject.to_params).to eq(from: '2way', to: '48702702702', message: 'Test')
    end
  end

  describe 'from argument passed' do
    subject { described_class.new(to: 48_702_702_702, body: '') }

    it 'gets overwritten' do
      expect(subject.from).to eq('2way')
    end
  end
end
