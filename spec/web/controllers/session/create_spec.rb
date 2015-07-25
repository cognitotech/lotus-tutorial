require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/create'

describe Web::Controllers::Session::Create do
  let(:action) { Web::Controllers::Session::Create.new }
  let(:params) { Hash[:sign_in => {email: 'quangkhai@ssf.vn', password: '123'}] }
  before do
    @user = User.new(email: 'quangkhai@ssf.vn', password: '123', name: 'Khai Le')
    @user = UserRepository.create(@user)
  end

  it 'redirects to root' do
    status, headers, _ = action.call(params)
    expect(status).to eq 302
    expect(headers['LOCATION']).to eq '/'
  end

  context 'when valid credentials' do
    it 'sets session user_id key' do
      action.call(params)
      expect(action.send(:session)).to have_key :user_id
    end
  end

  context 'when invalid credentials' do
    it 'exposes error message' do
      params[:sign_in][:email] = 'abc@def.com'
      action.call(params)
      expect(action.exposures[:messages]).to match_array ["Invalid email or password"]
    end
  end
end
