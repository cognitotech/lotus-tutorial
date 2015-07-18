require 'spec_helper'

RSpec.describe User do
  # place your tests here
  describe 'attributes' do
    subject { User.attributes }
    it { is_expected.to include(:id) }
    it { is_expected.to include(:name) }
    it { is_expected.to include(:email) }
    it { is_expected.to include(:password) }
  end
end
