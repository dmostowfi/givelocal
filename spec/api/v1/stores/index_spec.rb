require 'rails_helper'

RSpec.describe "stores#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stores", params: params
  end

  describe 'basic fetch' do
    let!(:store1) { create(:store) }
    let!(:store2) { create(:store) }

    it 'works' do
      expect(StoreResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['stores'])
      expect(d.map(&:id)).to match_array([store1.id, store2.id])
    end
  end
end
