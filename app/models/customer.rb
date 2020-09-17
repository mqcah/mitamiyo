class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_movies, through: :bookmarks, source: :movie
  # 追加
  #フォロー
  has_many :following_relationships,foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  #すでにフォロー済みであればture返す
  def following?(other_customer)
    self.followings.include?(other_user)
  end

  #ユーザーをフォローする
  def follow(other_customer)
    self.following_relationships.create(following_id: other_customer.id)
  end

  #ユーザーのフォローを解除する
  def unfollow(other_customer)
    self.following_relationships.find_by(following_id: other_customer.id).destroy
  end
  # ここまで

  attachment :image

  def active_for_authentication?
    super && (self.customer_status == true)
  end


  # 半角英数字のみ、重複なし
  validates :user_id, presence: true
  # 15文字以内
  validates :customer_name, presence: true
  # 100文字以内
  validates :profile, length: { maximum: 100}

end
