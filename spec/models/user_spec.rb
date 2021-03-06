require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'aaaa11'
        @user.password_confirmation = 'aaaa11'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合なら登録できる' do
        @user.password = 'aaa222'
        @user.password_confirmation = 'aaa222'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには「@」を含めなければできない' do
        @user.email = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字以下では保存できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'first_nameが全角で返ること' do
        @user.first_name = 'kanji'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid. Input full-width characters.")
      end
      it 'last_nameが全角で返ること' do
        @user.last_name = 'kanji'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name is invalid. Input full-width characters.")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ以外の全角文字だと登録できないことでは登録できない' do
        @user.first_name_kana = '阿いうえ岡'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters.")
      end
      it 'last_name_kanaがカタカナ以外の全角文字だと登録できないことでは登録できない' do
        @user.last_name_kana = '阿いうえ岡'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid. Input full-width katakana characters.")
      end
      it 'first_name_kanaがカタカナで返ること' do
        @user.first_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters.")
      end
      it 'last_name_kanaがカタカナで返ること' do
        @user.last_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end
