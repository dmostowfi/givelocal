require 'rails_helper'

RSpec.describe "my_wishes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/my_wishes", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'my_wishes',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(MyWishResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { MyWish.count }.by(1)
    end
  end
end
