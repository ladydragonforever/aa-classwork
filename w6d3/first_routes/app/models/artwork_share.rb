class ArtworkShare < ApplicationRecord
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
    
end
