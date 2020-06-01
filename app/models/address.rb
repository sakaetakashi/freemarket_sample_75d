class Address < ApplicationRecord
  validates :prefecture, :city, :block, presence: true, length: { maximum:30 }
  # 郵便番号：ハイフンあり・なし
  validates :post_code, presence: true, length: { maximum:7 }, format:{ with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ }
  # TEL：ハイフンなし
  validates :telephone_number, uniqueness: true, format:{ with: /\A[0-9]+\z/ }

  belongs_to :user, optional: true

end
