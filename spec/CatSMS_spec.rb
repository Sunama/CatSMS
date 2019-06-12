RSpec.describe CatSMS do
  it "has a version number" do
    expect(CatSMS::VERSION).not_to be nil
  end

  it 'THSMS send' do
    sms = CatSMS::SMS.new :thsms, { username: '', password: '' }
    status = sms.send('0000', '0942828425', 'test message')

    expect(status).to eq true
  end

  it 'THSMS credit' do
    sms = CatSMS::SMS.new :thsms, { username: '', password: '' }
    credit = sms.credit

    expect(credit[:success]).to eq true
  end
end
