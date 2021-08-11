require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品機能' do
    before do
      @item= FactoryBot.build(:item)
    end
    
    context '商品出品ができる時' do
      it 'item_nameとimage,description、category_id, condition_id, charges_id, source_id, days_id, priceが存在すれば登録できる' do
        @item.image = fixture_file_upload('app/assets/images/test.png')
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      context 'presence true' do
        it 'item_nameが空では登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'imageが空では登録できない' do
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'descriptionが空では登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが空では登録できない' do
          @item.image = fixture_file_upload('app/assets/images/test.png')
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'condition_idが空では登録できない' do
          @item.image = fixture_file_upload('app/assets/images/test.png')
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it 'charges_idが空では登録できない' do
          @item.image = fixture_file_upload('app/assets/images/test.png')
          @item.charges_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Charges can't be blank")
        end
        it 'source_idが空では登録できない' do
          @item.image = fixture_file_upload('app/assets/images/test.png')
          @item.source_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Source can't be blank")
        end
        it 'days_idが空では登録できない' do
          @item.image = fixture_file_upload('app/assets/images/test.png')
          @item.days_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days can't be blank")
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      end

      context 'price' do
        it '販売価格が¥300~¥9,999,999の範囲外だと保存できない' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
        it '販売価格は全角数字だと保存できない' do
          @item.price = '１００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end
        it '販売価格は数字意外だと保存できない' do
          @item.price = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end
      end
    end
  end
end
