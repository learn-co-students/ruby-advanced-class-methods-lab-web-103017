
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(new_name)
    self.all.detect{|song| song.name == new_name}
  end


  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    words = filename.split(" - ")
    song_name = (words.last)[0...-4]
    artist_name = words.first
    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = song_name
    new_song
  end

  def self.create_from_filename(filename)
    words = filename.split(" - ")
    song_name = (words.last)[0...-4]
    artist_name = words.first
    new_song = self.create
    new_song.artist_name = artist_name
    new_song.name = song_name
    new_song
  end


  def self.destroy_all
    @@all = []
  end
end
