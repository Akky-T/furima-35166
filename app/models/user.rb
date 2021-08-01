class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)+\z/ }
  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, format: { with: zenkaku, message: '全角ひらがな、、カタカナ、漢字を使用してください' }
  validates :first_name, presence: true, format: { with: zenkaku, message: '全角ひらがな、カタカナ、漢字を使用してください' }
  zenkaku_kana = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format: { with: zenkaku_kana, message: '全角カタカナを使用してください' }
  validates :first_name_kana, presence: true, format: { with: zenkaku_kana, message: '全角カタカナを使用してください' }
  validates :birth_day, presence: true

end

  # has_many :orders, dependent: :destroy
  # has_many :items, dependent: :destroy
  # validates :nickname, presence: true
  # validates :password, format: { with: /\A[a-z0-9]+\z/i }, length: { minimum: 6 }
  # validates :email, presence: true, uniqueness: true
  # validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  # validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: '全角ひらがな、漢字を使用してください'}
  # validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
  # validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
  # validates :birth_day, presence: true
