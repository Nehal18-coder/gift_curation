require 'rails_helper'

RSpec.describe "postcards#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/postcards/#{postcard.id}"
  end

  describe 'basic destroy' do
    let!(:postcard) { create(:postcard) }

    it 'updates the resource' do
      expect(PostcardResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Postcard.count }.by(-1)
      expect { postcard.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
