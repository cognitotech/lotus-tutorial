require 'spec_helper'
require_relative '../../../../apps/web/views/session/create'

describe Web::Views::Session::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/session/create.html.erb') }
  let(:view)      { Web::Views::Session::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
