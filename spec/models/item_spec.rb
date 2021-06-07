require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品保存' do
    context '商品出品できるとき' do
      it '全ての項目の入力が正しく存在すれば出品できること' do
        expect(@item).to be_valid
      end
      it 'period_idが２以上ならできる' do
        @item.period_id = 2
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像を１枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden can't be blank")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '発送までの日数についての情報が必須である' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '販売価格が半角英数字混合では出品できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角英字のみ保存可能できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it '販売価格は全角では保存可能できないこと' do
        @item.price = 'ａｂｃ１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      
      it 'period_idが1の場合は出品できないこと' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Period must be other than 1")
      end
      it '紐づくユーザーが存在しないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
      it 'condition_idが1の場合は出品できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition must be other than 1")
      end
      it 'burden_idが1の場合は出品できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden must be other than 1")
      end
      it 'prefecture_idが1の場合は出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture must be other than 1")
      end
      it 'category_idが1の場合は出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
    end
  end
end


