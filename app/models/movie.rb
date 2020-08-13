class Movie < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :bookmark, dependent: :destroy
  # boardのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(customer)
    bookmarks.where(customer_id: cusotmer.id).exists?
  end
  # 中間テーブルを先に記述しないといけない
  has_many :genres, through: :movie_genre_relations
  has_many :movie_genre_relations, dependent: :destroy

  validates :title,  presence: true
end
