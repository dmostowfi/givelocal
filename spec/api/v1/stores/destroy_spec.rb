require 'rails_helper'

RSpec.describe "stores#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/stores/#{store.id}"
  end

  describe 'basic destroy' do
    let!(:store) { create(:store) }

    it 'updates the resource' do
      expect(StoreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Store.count }.by(-1)
      expect { store.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
