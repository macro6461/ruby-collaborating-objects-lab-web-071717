require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    song_artist = Artist.find_or_create_by_name(name)
    song_artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    file = file_name.split(" - ")
    file.pop
    new_song = self.new(file[1])
    new_song.artist_name=(file[0])
    new_song
  end

end

# Pry.start
