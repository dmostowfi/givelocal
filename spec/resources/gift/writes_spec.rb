require 'rails_helper'

RSpec.describe GiftResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'gifts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GiftResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Gift.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:gift) { create(:gift) }

    let(:payload) do
      {
        data: {
          id: gift.id.to_s,
          type: 'gifts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GiftResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { gift.reload.updated_at }
      # .and change { gift.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:gift) { create(:gift) }

    let(:instance) do
      GiftResource.find(id: gift.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Gift.count }.by(-1)
    end
  end
end
