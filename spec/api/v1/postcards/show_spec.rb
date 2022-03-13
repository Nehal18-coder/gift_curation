require 'rails_helper'

RSpec.describe "postcards#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/postcards/#{postcard.id}", params: params
  end

  describe 'basic fetch' do
    let!(:postcard) { create(:postcard) }

    it 'works' do
      expect(PostcardResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('postcards')
      expect(d.id).to eq(postcard.id)
    end
  end
end
