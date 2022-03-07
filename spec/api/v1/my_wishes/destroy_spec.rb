require 'rails_helper'

RSpec.describe "my_wishes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/my_wishes/#{my_wish.id}"
  end

  describe 'basic destroy' do
    let!(:my_wish) { create(:my_wish) }

    it 'updates the resource' do
      expect(MyWishResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { MyWish.count }.by(-1)
      expect { my_wish.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
