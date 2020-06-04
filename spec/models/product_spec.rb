require 'rails_helper'
describe Product do
  describe '#create' do
    it "全て入力したら登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "product_nameが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:product_name]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "product_nameが41文字以上だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: "a" * 41,
      user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:product_name]).to include("は40文字以内で入力してください")
    end

    it "product_nameが40文字以下であれば登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: "a" * 40,
      user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "explainが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:explain]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "explainが1001文字以上だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: "a" * 1001,
      user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:explain]).to include("は1000文字以内で入力してください")
    end

    it "explainが1000文字以下であれば登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: "a" * 1000,
      user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "priceが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, price: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "brandがなくても登録出来ること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, brand: nil, user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "conditionが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, condition: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "arrive_atが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, arrive_at: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:arrive_at]).to include("を入力してください")
    end

    it "shipping_feeが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, shipping_fee: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:shipping_fee]).to include("を入力してください")
    end

    it "region_idが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, region_id: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:region_id]).to include("を入力してください")
    end

    it "category_idが無いと登録できないこと" do
      user = create(:user)
      product = FactoryBot.build(:product, user_id: user[:id], category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "user_idが無いと登録できないこと" do
      category = create(:category)
      product = FactoryBot.build(:product, user_id: nil, category_id: category[:id])
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end
  end

  describe '#update' do
    it "全て入力したら登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "product_nameが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:product_name]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "product_nameが41文字以上だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: "a" * 41,
      user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:product_name]).to include("は40文字以内で入力してください")
    end

    it "product_nameが40文字以下であれば登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, product_name: "a" * 40,
      user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "explainが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:explain]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "explainが1001文字以上だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: "a" * 1001,
      user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:explain]).to include("は1000文字以内で入力してください")
    end

    it "explainが1000文字以下であれば登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, explain: "a" * 1000,
      user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "priceが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, price: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "brandがなくても登録出来ること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, brand: nil, user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "conditionが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, condition: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "arrive_atが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, arrive_at: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:arrive_at]).to include("を入力してください")
    end

    it "shipping_feeが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, shipping_fee: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:shipping_fee]).to include("を入力してください")
    end

    it "region_idが無いと登録できないこと" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, region_id: nil, user_id: user[:id], category_id: category[:id])
      product.valid?
      expect(product.errors[:region_id]).to include("を入力してください")
    end

    it "category_idが無いと登録できないこと" do
      user = create(:user)
      product = FactoryBot.build(:product, user_id: user[:id], category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "user_idが無いと登録できないこと" do
      category = create(:category)
      product = FactoryBot.build(:product, user_id: nil, category_id: category[:id])
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end

  end

  describe '#search' do
  it ""
  end

end