require 'rails_helper'

RSpec.describe OrderOrderInfo, type: :model do
  before do
    @order_order_info = FactoryBot.build(:order_order_info, user_id: 1, item_id: 1)
  end
  describe '商品購入情報の保存' do
    context '購入情報が保存できる時' do
      it '全ての項目が正確に入力されているとき' do
        expect(@order_order_info).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空の時' do
        @order_order_info.token = ""
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空の時' do
        @order_order_info.post_code = ""
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code can't be blank")
      end
      it 'posta_codeがハイフンを含んでいなければ保存できないこと' do
        @order_order_info.post_code = "1111111"
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'posta_codeが全角だと保存できないこと' do
        @order_order_info.post_code = "１１１−１１１１"
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'posta_codeが半角英字だと保存できないこと' do
        @order_order_info.post_code = "aaa-aaaa"
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'posta_codeが半角ｶﾅだと保存できないこと' do
        @order_order_info.post_code = "ｱｱｱ-ｱｱｱｱ"
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'posta_codeが3文字-4文字の形以外だと保存できないこと' do
        @order_order_info.post_code = "1111-111"
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が空の時' do
        @order_order_info.prefecture_id = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が選択されていない時' do
        @order_order_info.prefecture_id = '1'
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の時' do
        @order_order_info.manicipalities = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Manicipalities can't be blank")
      end
      it '市区町村が空の時' do
        @order_order_info.address = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空の時' do
        @order_order_info.phone_number = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満の時' do
        @order_order_info.phone_number = '123456789'
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が全角の時' do
        @order_order_info.phone_number = '１２３４５６７８９０'
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が半角英字の時' do
        @order_order_info.phone_number = 'aaaaaaaaaa'
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が半角ｶﾅの時' do
        @order_order_info.phone_number = 'ﾊﾝｶｸｶﾅﾊﾝｶｸ'
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐づいていない時' do
        @order_order_info.user_id = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない時' do
        @order_order_info.item_id = ''
        @order_order_info.invalid?
        expect(@order_order_info.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
