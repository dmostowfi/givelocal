require 'rails_helper'

RSpec.describe "my_wishes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/my_wishes", params: params
  end

  describe 'basic fetch' do
    let!(:my_wish1) { create(:my_wish) }
    let!(:my_wish2) { create(:my_wish) }

    it 'works' do
      expect(MyWishResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['my_wishes'])
      expect(d.map(&:id)).to match_array([my_wish1.id, my_wish2.id])
    end
  end
end
