require "rails_helper"

RSpec.describe PostcardResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "postcards",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PostcardResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Postcard.count }.by(1)
    end
  end

  describe "updating" do
    let!(:postcard) { create(:postcard) }

    let(:payload) do
      {
        data: {
          id: postcard.id.to_s,
          type: "postcards",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PostcardResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { postcard.reload.updated_at }
      # .and change { postcard.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:postcard) { create(:postcard) }

    let(:instance) do
      PostcardResource.find(id: postcard.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Postcard.count }.by(-1)
    end
  end
end
