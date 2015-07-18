require 'spec_helper'
require_relative '../../../../apps/web/views/registration/index'

describe Web::Views::Registration::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/registration/index.html.erb') }
  let(:view)      { Web::Views::Registration::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
