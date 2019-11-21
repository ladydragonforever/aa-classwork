class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork
end
