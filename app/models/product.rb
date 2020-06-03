class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :user
  belongs_to :buyer, class_name: "User", optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites, source: :user

  validates :user_id, :category_id, :condition, :arrive_at, :shipping_fee, :region_id,  presence: true
  validates :product_name, presence: true, length: { in: 1..40 }
  validates :explain, presence: true, length: { in: 1..1000 }
  validates :price, numericality: { greater_than_or_equal_to: 50 }
  validates :images, presence: true

end