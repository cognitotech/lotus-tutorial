require 'spec_helper'
require_relative '../../../../apps/web/views/session/destroy'

describe Web::Views::Session::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/session/destroy.html.erb') }
  let(:view)      { Web::Views::Session::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
