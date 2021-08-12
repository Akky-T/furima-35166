class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :orders, dependent: :destroy
  # has_many :items, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  validates :password,
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'is invalid. Include both letters and numbers' }

  zenkaku = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  with_options presence: true, format: { with: zenkaku, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  zenkaku_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: { with: zenkaku_kana, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
