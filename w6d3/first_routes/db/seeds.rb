# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do #All or nothing

  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  users = User.create! ([{user_name: 'todd'}, {user_name: 'superman'}, 
    {user_name: 'clark_kent'}, {user_name: 'wonder_woman'} ])
  
  artworks = Artwork.create! ([{title: "pizza", image_url: "pizza.com", artist_id: users[0].id},
    {title: "kryptonite", image_url: "kryptonite.com",artist_id: users[1].id},
    {title: "newspaper", image_url: "newspaper.com",artist_id: users[2].id},
    {title: "themyscira", image_url: "themyscira.com",artist_id: users[3].id}]) 

  ArtworkShare.create!(artwork_id: artworks[0].id, viewer_id: users[1].id)
  ArtworkShare.create!(artwork_id: artworks[1].id, viewer_id: users[3].id)
  ArtworkShare.create!(artwork_id: artworks[2].id, viewer_id: users[0].id)
  ArtworkShare.create!(artwork_id: artworks[3].id, viewer_id: users[2].id)

  Comment.create!(user_id: users[1].id, artwork_id: artworks[0].id, body: "This pizza is SUPER delicious. I want a slice!")
  # debugger
  Comment.create!(user_id: users[0].id, artwork_id: artworks[2].id, body: "Always the same news. FAKE NEWS!!!")
  Comment.create!(user_id: users[3].id, artwork_id: artworks[1].id, body: "I don't even with you Clark....I mean Superman")
  Comment.create!(user_id: users[2].id, artwork_id: artworks[3].id, body: "Looks like a great vacation spot. So many ladies!")

  Like.create!(likable_type: "Artwork", likable_id: artworks[0].id)
  Like.create!(likable_type: "Comment", likable_id: comments[0].id)
end
