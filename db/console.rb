require("pry")
require_relative("../models/albums")
require_relative("../models/artists")

Album.delete_all()
Artist.delete_all()
artist1 = Artist.new({
  "artist_name" => "Amy Winehouse"
  })

artist1.save()

artist2 = Artist.new({
  "artist_name" => "Oasis"
  })

artist2.save()

list = Artist.list_names()
album1 = Album.new({
  "album_name" => "Back to Black",
  "genre" => "Britpop",
  "artist_id" => artist2.id
  })

album1.save()

# album2 = Album.new({
#   "album_name" => "Don't Look Back in Anger",
#   "genre" => "Soul",
#   "artist_id" => artist1.id
#   })
#
# album2.save()
#
# album3 = Album.new({
#   "album_name" => "Be Here Now",
#   "genre" => "Britpop",
#   "artist_id" => artist2.id
#   })
#
# album3.save()

binding.pry
nil
