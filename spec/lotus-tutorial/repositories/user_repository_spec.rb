require 'spec_helper'

RSpec.describe UserRepository do
  # place your tests here
  describe "#check_login" do
    let(:email) { 'quangkhai@ssf.vn' }
    let(:password) { '123' }
    before do
      @user = User.new(email: 'quangkhai@ssf.vn', password: '123', name: 'Khai Le')
      @user = UserRepository.create(@user)
    end
    context 'valid credentials' do
      it 'returns the user' do
        expect(UserRepository.check_login(email, password)).to eq @user
      end
    end

    context 'invalid credentials' do
      it 'returns nil' do
        expect(UserRepository.check_login(email, 'abc')).to be_nil
      end
    end
  end
end
