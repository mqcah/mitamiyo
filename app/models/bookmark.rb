class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  validates :customer_id, uniqueness: { scope: :movie_id }
end
