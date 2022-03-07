require 'rails_helper'

RSpec.describe MyWishResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'my_wishes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MyWishResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { MyWish.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:my_wish) { create(:my_wish) }

    let(:payload) do
      {
        data: {
          id: my_wish.id.to_s,
          type: 'my_wishes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MyWishResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { my_wish.reload.updated_at }
      # .and change { my_wish.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:my_wish) { create(:my_wish) }

    let(:instance) do
      MyWishResource.find(id: my_wish.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { MyWish.count }.by(-1)
    end
  end
end
