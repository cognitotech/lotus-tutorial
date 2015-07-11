require 'spec_helper'
require_relative '../../lib/authentications/web_strategy.rb'
describe Authentication::WebStrategy do
  describe 'authenticate!' do
    before do
      kclass = Class.new do
        include Lotus::Action
        include Lotus::Action::Session
        include Authentication::WebStrategy
      end
      @action = kclass.new
    end
    context 'when user signed in' do
      it 'returns true' do
        allow(@action).to receive(:session).and_return({user_id: 1})
        expect(@action.authenticate!).to eq true
      end
    end

    context 'when user is a guest' do
      it 'raises UnauthenticatedError' do
        allow(@action).to receive(:session).and_return({})
        expect{ @action.authenticate! }.to raise_error(Authentication::UnauthenticatedError)
      end
    end
  end
end