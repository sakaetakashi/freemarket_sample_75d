class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category, dependent: :destroy
  belongs_to :user
  belongs_to :buyer, class_name: "User", optional: true

  validates :category_id, :condition, :arrive_at, :price, :shipping_fee, :region_id,  presence: true
  validates :product_name, presence: true, length: { in: 1..40 }
  validates :explain, presence: true, length: { in: 1..1000 }

end