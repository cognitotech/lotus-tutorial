require 'spec_helper'
require_relative '../../../../apps/web/controllers/registration/create'

describe Web::Controllers::Registration::Create do
  let(:action) { Web::Controllers::Registration::Create.new }


  context 'valid params' do
    let(:params) { Hash[sign_up: {email: 'khai.le@live.com', password: '123', password_confirmation: '123', name: 'Khai'}] }
    it 'creates new User in database' do
      expect { action.call(params) }.to change{UserRepository.all.count}.by(1)
    end

    it 'redirects to login page' do
      status, headers, _ = action.call(params)
      expect(status).to eq 302
    end
  end

  context 'invalid params' do
    let(:params) { Hash[sign_up: {email: '123', password: '123', password_confirmation: '123', name: 'Khai'}] }
    it 'exposes error message' do
      action.call(params)
      expect(action.exposures[:messages]).to match_array [{content: "email is invalid. Validation: format", type: :danger}]
    end

    it 'is successful' do
      status, _, _ = action.call(params)
      expect(status).to eq 200
    end
  end
end
