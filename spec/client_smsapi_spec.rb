require 'spec_helper'

RSpec.describe SMSApi do
  it 'has a version number' do
    expect(SMSApi::VERSION).not_to be nil
  end
end
