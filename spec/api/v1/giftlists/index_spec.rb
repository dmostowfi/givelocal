require 'rails_helper'

RSpec.describe "giftlists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/giftlists", params: params
  end

  describe 'basic fetch' do
    let!(:giftlist1) { create(:giftlist) }
    let!(:giftlist2) { create(:giftlist) }

    it 'works' do
      expect(GiftlistResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['giftlists'])
      expect(d.map(&:id)).to match_array([giftlist1.id, giftlist2.id])
    end
  end
end
