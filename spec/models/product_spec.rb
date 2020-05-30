require 'rails_helper'
describe Product do
  describe '#create' do
    it "全て入力したら登録できること" do
      user = create(:user)
      category = create(:category)
      product = FactoryBot.build(:product, user_id: user[:id], category_id: category[:id])
      expect(product).to be_vaild
    end
  end
end