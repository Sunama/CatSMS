RSpec.describe CatSMS do
  it "has a version number" do
    expect(CatSMS::VERSION).not_to be nil
  end

  it 'THSMS' do
    sms = CatSMS::SMS.new :thsms, { username: '', password: '' }
    credit = sms.credit

    expect(credit[:success]).to eq true
  end
end
