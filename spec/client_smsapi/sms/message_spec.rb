RSpec.describe SMSApi::SMS::Message do
  subject { described_class.new(to: 48_702_702_702, body: '') }

  describe '#valid?' do
    let(:invalid_recipient) { described_class.new(to: :invalid_recipient, body: '') }

    it 'valid with recipient phone' do
      expect(subject.valid?).to be(true)
    end

    it 'invalid with non phone number recipient' do
      expect(invalid_recipient.valid?).to be(false)
    end
  end
end
