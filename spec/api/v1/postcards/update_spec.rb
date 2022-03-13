require "rails_helper"

RSpec.describe "postcards#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/postcards/#{postcard.id}", payload
  end

  describe "basic update" do
    let!(:postcard) { create(:postcard) }

    let(:payload) do
      {
        data: {
          id: postcard.id.to_s,
          type: "postcards",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PostcardResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { postcard.reload.attributes }
    end
  end
end
