require 'spec_helper'
require_relative '../../lib/form-objects/sign_up'

describe FormObject::SignUp do
  let(:valid_properties) { {email: 'abc@def.com', display_name: 'Display Name', password: '123', password_confirmation: '123'} }

  it 'is valid' do
    expect(FormObject::SignUp.new(valid_properties)).to be_valid
  end

  describe 'validations' do
    before do
      @form = FormObject::SignUp.new(valid_properties)
    end
    it 'validates email format' do
      @form.email = 'abc'
      expect(@form).not_to be_valid
    end

    it 'validates email presence' do
      @form.email = ''
      expect(@form).not_to be_valid
    end

    it 'validates display_name presence' do
      @form.display_name = ''
      expect(@form).not_to be_valid
    end

    it 'validates password confirmation' do
      @form.password_confirmation = 'abc'
      expect(@form).not_to be_valid
    end
  end
end