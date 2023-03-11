require 'rails_helper'

RSpec.describe Item, type: :request do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user_id = @user.id
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end
  

  
  describe '商品の出品ができる時' do
    context '出品できるとき' do
      it "ログイン状態で全ての項目が正確に入力されているとき" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない時' do
      it "ログインしていない時" do
        @item.user_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "画像が空の時" do
        @item.image = nil
        @item.invalid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空の時" do
        @item.name = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空の時" do
        @item.explain = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "カテゴリーが空の時" do
        @item.category_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーが選択されていない時" do
        @item.category_id = "1"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空の時" do
        @item.condition_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品の状態が選択されていない時" do
        @item.condition_id = "1"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が空の時" do
        @item.shipping_charge_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "配送料の負担が選択されていない時" do
        @item.shipping_charge_id = "1"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "発送元の地域が空の時" do
        @item.prefecture_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域が選択されていない時" do
        @item.prefecture_id = "1"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が空の時" do
        @item.shipping_day_id = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "発送までの日数が選択されていない時" do
        @item.shipping_day_id = "1"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "価格が空の時" do
        @item.price = ""
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300未満の時" do
        @item.price = "299"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格が1000万以上の時" do
        @item.price = "10000000"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格が半角英字の時" do
        @item.price = "hankakueiji"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が半角ｶﾅの時" do
        @item.price = "ﾊﾝｶｸｶﾅ"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が全角数字の時" do
        @item.price = "１１１"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が全角英字の時" do
        @item.price = "ＡＡＡ"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が全角かなの時" do
        @item.price = "ぜんかくかな"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が全角カナの時" do
        @item.price = "ゼンカクカナ"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が全角漢字の時" do
        @item.price = "全角漢字"
        @item.invalid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
    end
  end
end
