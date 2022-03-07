require "rails_helper"

RSpec.describe "stores#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stores/#{store.id}", params: params
  end

  describe "basic fetch" do
    let!(:store) { create(:store) }

    it "works" do
      expect(StoreResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("stores")
      expect(d.id).to eq(store.id)
    end
  end
end
