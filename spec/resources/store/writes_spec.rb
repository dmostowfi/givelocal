require 'rails_helper'

RSpec.describe StoreResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'stores',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StoreResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Store.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:store) { create(:store) }

    let(:payload) do
      {
        data: {
          id: store.id.to_s,
          type: 'stores',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StoreResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { store.reload.updated_at }
      # .and change { store.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:store) { create(:store) }

    let(:instance) do
      StoreResource.find(id: store.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Store.count }.by(-1)
    end
  end
end
