class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_movies, through: :bookmarks, source: :movie

  attachment :image


  # 半角英数字のみ、重複なし
  validates :user_id, presence: true
  # 15文字以内
  validates :customer_name, presence: true
  # 100文字以内
  validates :profile, length: { maximum: 100}

end
