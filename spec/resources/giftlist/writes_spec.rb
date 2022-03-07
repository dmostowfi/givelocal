require "rails_helper"

RSpec.describe GiftlistResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "giftlists",
          attributes: {},
        },
      }
    end

    let(:instance) do
      GiftlistResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Giftlist.count }.by(1)
    end
  end

  describe "updating" do
    let!(:giftlist) { create(:giftlist) }

    let(:payload) do
      {
        data: {
          id: giftlist.id.to_s,
          type: "giftlists",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      GiftlistResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { giftlist.reload.updated_at }
      # .and change { giftlist.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:giftlist) { create(:giftlist) }

    let(:instance) do
      GiftlistResource.find(id: giftlist.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Giftlist.count }.by(-1)
    end
  end
end
