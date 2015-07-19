RSpec.describe SMSApi::Validators::PhoneNumberValidator do
  let(:valid_numbers) do
    [
      '48123456789',
      '123456789',
      48_123_456_789,
      123_456_789
    ]
  end

  let(:invalid_numbers) do
    [
      '+48123456789',
      :symbol,
      'text',
      '(48)123456789',
      123.456789
    ]
  end

  it 'works for valid numbers' do
    valid_numbers.each do |number|
      result = SMSApi::Validators::PhoneNumberValidator.valid_number?(number)
      expect(result).to be(true)
    end
  end

  it 'does not work for invalid numbers' do
    valid_numbers.each do |number|
      result = SMSApi::Validators::PhoneNumberValidator.valid_number?(number)
      expect(result).to be(false)
    end
  end
end
