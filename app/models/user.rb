class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :nickname, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "is invalid. Include both letters and numbers" }
  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, format: { with: zenkaku, message: "is invalid. Input full-width characters" }
  validates :first_name, presence: true, format: { with: zenkaku, message: "is invalid. Input full-width characters" }
  zenkaku_kana = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters" }
  validates :birth_day, presence: true
end
