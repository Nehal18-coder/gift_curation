require "rails_helper"

RSpec.describe "postcards#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/postcards", params: params
  end

  describe "basic fetch" do
    let!(:postcard1) { create(:postcard) }
    let!(:postcard2) { create(:postcard) }

    it "works" do
      expect(PostcardResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["postcards"])
      expect(d.map(&:id)).to match_array([postcard1.id, postcard2.id])
    end
  end
end
