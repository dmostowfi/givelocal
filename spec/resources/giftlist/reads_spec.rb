require "rails_helper"

RSpec.describe GiftlistResource, type: :resource do
  describe "serialization" do
    let!(:giftlist) { create(:giftlist) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(giftlist.id)
      expect(data.jsonapi_type).to eq("giftlists")
    end
  end

  describe "filtering" do
    let!(:giftlist1) { create(:giftlist) }
    let!(:giftlist2) { create(:giftlist) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: giftlist2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([giftlist2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:giftlist1) { create(:giftlist) }
      let!(:giftlist2) { create(:giftlist) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      giftlist1.id,
                                      giftlist2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      giftlist2.id,
                                      giftlist1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
