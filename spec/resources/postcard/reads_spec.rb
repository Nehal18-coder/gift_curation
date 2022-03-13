require 'rails_helper'

RSpec.describe PostcardResource, type: :resource do
  describe 'serialization' do
    let!(:postcard) { create(:postcard) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(postcard.id)
      expect(data.jsonapi_type).to eq('postcards')
    end
  end

  describe 'filtering' do
    let!(:postcard1) { create(:postcard) }
    let!(:postcard2) { create(:postcard) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: postcard2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([postcard2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:postcard1) { create(:postcard) }
      let!(:postcard2) { create(:postcard) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            postcard1.id,
            postcard2.id
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
            postcard2.id,
            postcard1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
