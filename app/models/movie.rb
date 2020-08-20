class Movie < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :genre, optional: true
  has_many :bookmarks, dependent: :destroy
  # 中間テーブルを先に記述しないといけない
  has_many :movie_genre_relations
  has_many :genres, through: :movie_genre_relations

  attachment :movie_image

# movieのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(customer)
    bookmarks.where(customer_id: customer.id).exists?
  end
  scope :recent, -> { order(created_at: :desc) }

  with_options presence: true do
    validates :title
    validates :rate
    validates :genre_ids
  end

end
