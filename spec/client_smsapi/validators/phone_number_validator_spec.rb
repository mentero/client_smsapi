RSpec.describe SMSApi::Validators::PhoneNumberValidator do
  VALID_NUMBERS = [
    '48123456789',
    '123456789',
    48_123_456_789,
    123_456_789
  ]

  VALID_NUMBERS.each do |number|
    it "#{number} is valid" do
      result = described_class.valid_number?(number)
      expect(result).to be(true)
    end
  end

  INVALID_NUMBERS = [
    '+48123456789',
    :symbol,
    'text',
    '(48)123456789',
    123.456789
  ]

  INVALID_NUMBERS.each do |number|
    it "#{number} is invalid" do
      result = described_class.valid_number?(number)
      expect(result).to be(false)
    end
  end
end
