require "rails_helper"

RSpec.describe "stores#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/stores/#{store.id}", payload
  end

  describe "basic update" do
    let!(:store) { create(:store) }

    let(:payload) do
      {
        data: {
          id: store.id.to_s,
          type: "stores",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(StoreResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { store.reload.attributes }
    end
  end
end
