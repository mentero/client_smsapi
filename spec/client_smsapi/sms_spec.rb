RSpec.describe SMSApi::SMS do
  it 'holds serverlist' do
    expect(SMSApi::SMS::SERVERS).to be_a(Array)
  end

  it 'we have 2 servers for now' do
    expect(SMSApi::SMS::SERVERS.count).to eq(2)
  end
end
