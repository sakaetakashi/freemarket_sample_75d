require 'rails_helper'

#新規登録・ログインの単体テスト
describe User do
  describe '#create' do

    it "nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, birthday項目が入力されれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録ができないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "重複するnicknameが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end

    it "重複するemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordがないと登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが６文字以下では登録できないこと" do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include()
    end

    it "family_nameがないと登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください", "は不正な値です")
    end

    it "family_nameが半角では登録できないこと" do
      user = build(:user, family_name: "ｱﾍﾞ")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "first_nameがないと登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    it "first_nameが半角では登録できないこと" do
      user = build(:user, first_name: "ｼﾝｿﾞｳ")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "family_name_kanaがないと登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "family_name_kanaが半角では登録できないこと" do
      user = build(:user, family_name_kana: "ｱﾍﾞ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが漢字では登録できないこと" do
      user = build(:user, first_name_kana: "晋三")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaがないと登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    it "first_name_kanaが半角では登録できないこと" do
      user = build(:user, first_name_kana: "ｼﾝｿﾞｳ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが漢字では登録できないこと" do
      user = build(:user, first_name_kana: "晋三")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "birthdayがないと登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end