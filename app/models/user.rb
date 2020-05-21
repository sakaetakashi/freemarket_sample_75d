class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :birthday, 
            :post_code, :prefecture, :city, :block, :building, :telephone_number, :user_id,
            presence: true

    has_many :products, dependent: :destroy
    has_many :credits, dependent: :destroy
    has_many :adresses, dependent: :destroy

  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
