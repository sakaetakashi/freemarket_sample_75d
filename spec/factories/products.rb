
FactoryBot.define do

  factory :product do
    product_name    {"iphone"}
    explain         {"最新バージョンです"}
    price           {100000}
    brand           {"apple"}
    condition       {"目立たない傷あり"}
    arrive_at       {"1〜2日で発送"}
    shipping_fee    {"出品者負担(元払い)"}
    region_id       {1}
    user_id         {1}
    category_id     {1}
    images {[
      FactoryBot.build(:image, product:nil)
    ]}
  end

end

