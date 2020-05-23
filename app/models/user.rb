class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, :first_name, presence: true, length: { maximum:10 }, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, :first_name_kana, presence: true, length: { maximum:10 }, format:{ with: /\A[ぁ-んァ-ヶー－]+\z/ }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum:10 }
  validates :birthday, presence: true

  has_many :products, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_one :address, dependent: :destroy

  devise :validatable, password_length: 7..128

  # include JpPrefecture
  # jp_prefecture :prefecture
  
  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  # end
  
  # def prefecture_name=(prefecture_name)
  #   self.prefecture = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

end
