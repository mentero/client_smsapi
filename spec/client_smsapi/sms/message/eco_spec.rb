RSpec.describe SMSApi::SMS::Message::Eco do
  subject { described_class.new(to: 48_702_702_702, body: 'Test') }

  it 'has its readers set up' do
    expect(subject.to).to eq(48_702_702_702)
    expect(subject.from).to eq('Eco')
    expect(subject.body).to eq('Test')
  end

  describe '.to_params' do
    it 'returns correct hash' do
      expect(subject.to_params).to eq(from: 'Eco', to: '48702702702', message: 'Test')
    end
  end

  describe 'from argument passed' do
    subject { described_class.new(to: 48_702_702_702, body: '') }

    it 'gets overwritten' do
      expect(subject.from).to eq('Eco')
    end
  end
end
