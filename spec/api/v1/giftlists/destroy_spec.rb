require "rails_helper"

RSpec.describe "giftlists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/giftlists/#{giftlist.id}"
  end

  describe "basic destroy" do
    let!(:giftlist) { create(:giftlist) }

    it "updates the resource" do
      expect(GiftlistResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Giftlist.count }.by(-1)
      expect { giftlist.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
