require "rails_helper"

RSpec.describe "my_wishes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/my_wishes/#{my_wish.id}", payload
  end

  describe "basic update" do
    let!(:my_wish) { create(:my_wish) }

    let(:payload) do
      {
        data: {
          id: my_wish.id.to_s,
          type: "my_wishes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MyWishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { my_wish.reload.attributes }
    end
  end
end
