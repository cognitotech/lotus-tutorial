require 'spec_helper'
require_relative '../../../../apps/web/controllers/registration/index'

describe Web::Controllers::Registration::Index do
  let(:action) { Web::Controllers::Registration::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
