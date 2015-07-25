require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/destroy'

describe Web::Controllers::Session::Destroy do
  let(:action) { Web::Controllers::Session::Destroy.new }
  let(:params) { Hash[] }

  before do
    allow(action).to receive(:session).and_return(user_id: 1)
  end

  it "redirects to root" do
    response = action.call(params)
    expect(response[0]).to eq 302
    expect(response[1]['LOCATION']).to eq '/'
  end

  it 'deletes the user_id in session' do
    action.call(params)
    expect(action.send(:session)).not_to have_key :user_id
  end
end
