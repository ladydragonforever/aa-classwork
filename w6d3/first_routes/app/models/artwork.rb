class Artwork < ApplicationRecord
  validates :title, uniqueness: {scope: :artist_id}

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

   has_many :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork  
end
