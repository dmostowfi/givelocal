require 'rails_helper'

RSpec.describe MyWishResource, type: :resource do
  describe 'serialization' do
    let!(:my_wish) { create(:my_wish) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(my_wish.id)
      expect(data.jsonapi_type).to eq('my_wishes')
    end
  end

  describe 'filtering' do
    let!(:my_wish1) { create(:my_wish) }
    let!(:my_wish2) { create(:my_wish) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: my_wish2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([my_wish2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:my_wish1) { create(:my_wish) }
      let!(:my_wish2) { create(:my_wish) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            my_wish1.id,
            my_wish2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            my_wish2.id,
            my_wish1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
