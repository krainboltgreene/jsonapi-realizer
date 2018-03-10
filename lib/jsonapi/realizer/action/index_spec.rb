require "spec_helper"

RSpec.describe JSONAPI::Realizer::Action::Index do
  let(:action) { described_class.new(payload: payload, headers: headers, type: :photos) }

  describe "#call" do
    subject { action.call }

    context "with no top-level data" do

    end

    context "with a good payload and good headers" do
      let(:payload) do
        {}
      end
      let(:headers) do
        {
          "Content-Type" => "application/vnd.api+json",
          "Accept" => "application/vnd.api+json"
        }
      end

      before do
        Photo::STORE["550e8400-e29b-41d4-a716-446655440000"] = {
          id: "550e8400-e29b-41d4-a716-446655440000",
          title: "Ember Hamster",
          src: "http://example.com/images/productivity.png"
        }
        Photo::STORE["d09ae4c6-0fc3-4c42-8fe8-6029530c3bed"] = {
          id: "d09ae4c6-0fc3-4c42-8fe8-6029530c3bed",
          title: "Ember Fox",
          src: "http://example.com/images/productivity-2.png"
        }
      end

      it "is the right model" do
        expect(subject).to include(a_kind_of(Photo), a_kind_of(Photo))
      end
    end
  end
end
