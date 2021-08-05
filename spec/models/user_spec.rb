require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザ登録ができる時' do
      it 'nicknameとemail、password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      context 'presence true' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it '生年月日の入力がなければ登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end

      context 'password' do
        it 'password == password_confirmationでなければ登録できない' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aab'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordは英字のみでは登録できない' do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end
        it 'passwordは数字のみでは登録できない' do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end
        it 'passwordは全角では登録できない' do
          @user.password = "あいうえおか"
          @user.password_confirmation = "あいうえおか"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '000aa'
          @user.password_confirmation = '000aa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
      end

      context 'email' do
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@が含まれていないと登録できない' do
          @user.email = 'abcdef.co.jp'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
      end
        
      context 'name' do
        it 'ユーザ本名(全角)の苗字は全角入力でなければ登録できない' do
          @user.last_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
        end
        it 'ユーザ本名(全角)の名前は全角入力でなければ登録できない' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
        end
        it 'ユーザ本名(カナ)の苗字は全角カナ入力でなければ登録できない' do
          @user.last_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
        end
        it 'ユーザ本名(カナ)の名前は全角カナ入力でなければ登録できない' do
          @user.first_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
        end
        it 'ユーザ本名(カナ)の苗字はひらがなでは登録できない' do
          @user.last_name_kana = 'あいう'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
        end
        it 'ユーザ本名(カナ)の名前はひらがなでは登録できない' do
          @user.first_name_kana = 'あいう'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
        end
      end
    end
  end
end