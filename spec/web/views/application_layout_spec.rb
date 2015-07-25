require 'spec_helper'

describe Web::Views::ApplicationLayout do
  describe "#flash_message" do
    let(:template) { Lotus::View::Template.new('apps/web/templates/application.html.erb') }
    subject { Web::Views::ApplicationLayout.new(template, {}) }
    let(:message) { "This is the message" }

    context "not dismissable" do
      it 'renders the message' do
        expect(subject.flash_message(message).to_s).to match %Q(<div class="alert alert-info" role="alert">\n<p>This is the message</p>\n</div>)
      end
    end

    context 'dismissable' do
      it 'renders the message and a dismiss button' do
        expect(subject.flash_message(message, :info, true).to_s).to match %Q(<div class="alert alert-info alert-dismissable" role="alert">\n<button type="button" class="close" data-dismiss="alert" aria-label="Close">\n<span aria-hidden="true">\n&times;\n</span>\n</button>\n<p>This is the message</p>\n</div>)
      end
    end
  end
end