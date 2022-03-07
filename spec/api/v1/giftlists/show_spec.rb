require "rails_helper"

RSpec.describe "giftlists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/giftlists/#{giftlist.id}", params: params
  end

  describe "basic fetch" do
    let!(:giftlist) { create(:giftlist) }

    it "works" do
      expect(GiftlistResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("giftlists")
      expect(d.id).to eq(giftlist.id)
    end
  end
end
