require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "全ての条件が整った場合" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空の時" do
        @user.nickname = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空の時" do
        @user.email = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていない時" do
        @user.email = "aaaaaa"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが既に登録されている時" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.invalid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空の時" do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが一致しない時" do
        @user.password = "111aaa"
        @user.password_confirmation = "111bbb"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみの時" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it "passwordが英字のみの時" do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it "passwordが6文字未満の時" do
        @user.password = "11aaa"
        @user.password_confirmation = @user.password
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角文字を含む時" do
        @user.password = "１１１aaa"
        @user.password_confirmation = @user.password
        @user.invalid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it "last_nameが空の時" do
        @user.last_name = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters")
      end
      it "first_nameが空の時" do
        @user.first_name = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters")
      end
      it "last_nameが半角の時" do
        @user.last_name = "ﾊﾝｶｸ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it "first_nameが半角の時" do
        @user.first_name = "ﾊﾝｶｸ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it "last_nameが全角英字の時" do
        @user.last_name = "ＺＥＮＫＡＫＵＥＩＪＩ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it "first_nameが全角英字の時" do
        @user.first_name = "ＺＥＮＫＡＫＵＥＩＪＩ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it "last_nameが全角数字の時" do
        @user.last_name = "１１１"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it "first_nameが全角数字の時" do
        @user.first_name = "１１１"
        @user.invalid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it "kana_first_nameが半角ｶﾅの時" do
        @user.kana_first_name = "ﾊﾝｶｸ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが空の時" do
        @user.kana_last_name = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", "Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが空の時" do
        @user.kana_first_name = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", "Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが半角ｶﾅの時" do
        @user.kana_last_name = "ﾊﾝｶｸ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが半角英字の時" do
        @user.kana_first_name = "hankaku"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが半角英字の時" do
        @user.kana_last_name = "hankaku"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが半角数字の時" do
        @user.kana_first_name = "111"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが半角数字の時" do
        @user.kana_last_name = "111"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが全角かなの時" do
        @user.kana_first_name = "ぜんかくかな"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが全角かなの時" do
        @user.kana_last_name = "ぜんかくかな"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが全角英字の時" do
        @user.kana_first_name = "ＡＡＡ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが全角英字の時" do
        @user.kana_last_name = "ＡＡＡ"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "kana_first_nameが全角数字の時" do
        @user.kana_first_name = "１１１"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters")
      end
      it "kana_last_nameが全角数字の時" do
        @user.kana_last_name = "１１１"
        @user.invalid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters")
      end
      it "birthdayが空の時" do
        @user.birthday = ""
        @user.invalid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
