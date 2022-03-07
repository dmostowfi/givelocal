require 'rails_helper'

RSpec.describe "giftlists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/giftlists/#{giftlist.id}", payload
  end

  describe 'basic update' do
    let!(:giftlist) { create(:giftlist) }

    let(:payload) do
      {
        data: {
          id: giftlist.id.to_s,
          type: 'giftlists',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GiftlistResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { giftlist.reload.attributes }
    end
  end
end
