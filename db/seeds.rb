(1..20).each do |num|
  Song.create(
    title: "Song#{num}",
    released: num%2 == 0 ? true : false,
    release_year: Date.today.year - num%5,
    artist_name: "Artist#{num}",
    genre: "Genre#{num}"
  )
end