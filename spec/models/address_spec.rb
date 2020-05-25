require 'rails_helper'

#新規登録・ログインの単体テスト
describe Address do
  describe '#create' do

    it "post_code, prefecture, city, block, building, telephone_number項目が入力されれば、登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "post_codeがないと登録できないこと" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end

    it "prefectureがないと登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがないと登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "blockがないと登録できないこと" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

    it "post_codeが８文字以上では登録できないこと" do
      address = build(:address, post_code: "00000000")
      address.valid?
      expect(address.errors[:post_code]).to include("は不正な値です")
    end

    it "telephone_numberが9文字以下では登録できないこと" do
      address = build(:address, telephone_number: "000000000")
      address.valid?
      expect(address.errors[:telephone_number]).to include()
    end

    it "telephone_numberが12文字以上では登録できないこと" do
      address = build(:address, telephone_number: "000000000000")
      address.valid?
      expect(address.errors[:telephone_number]).to include()
    end

    it "post_codeが全角では登録できないこと" do
      address = build(:address, post_code: "０００００００")
      address.valid?
      expect(address.errors[:post_code]).to include("は不正な値です")
    end

    it "telephone_numberが全角では登録できないこと" do
      address = build(:address, telephone_number: "００００００００００")
      address.valid?
      expect(address.errors[:telephone_number]).to include("は不正な値です")
    end

    it "telephone_numberが既存のものでは登録できないこと" do
      address = create(:address)
      another_address = build(:address, telephone_number: address.telephone_number)
      another_address.valid?
      expect(another_address.errors[:telephone_number]).to include("はすでに存在します")
    end

  end
end