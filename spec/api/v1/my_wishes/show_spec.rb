require 'rails_helper'

RSpec.describe "my_wishes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/my_wishes/#{my_wish.id}", params: params
  end

  describe 'basic fetch' do
    let!(:my_wish) { create(:my_wish) }

    it 'works' do
      expect(MyWishResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('my_wishes')
      expect(d.id).to eq(my_wish.id)
    end
  end
end
