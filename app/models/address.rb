class Address < ApplicationRecord
  
  validates :s_family_name, :s_first_name, presence: true, length: { maximum:10 }, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :s_family_name_kana, :s_first_name_kana, presence: true, length: { maximum:10 }, format:{ with: /\A[ぁ-んァ-ヶー－]+\z/ }
  
  validates :prefecture, :city, :block, presence: true, length: { maximum:30 }
  # 郵便番号：ハイフンあり・なし
  validates :post_code, presence: true, length: { maximum:7 }, format:{ with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ }
  # TEL：ハイフンなし
  validates :telephone_number, uniqueness: true

  belongs_to :user, optional: true

end
