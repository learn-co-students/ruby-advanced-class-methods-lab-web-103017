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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(song)
    new_song = Song.new
    name_artist = song.gsub(".mp3", "").split(" - ")
    new_song.name = name_artist[1]
    new_song.artist_name = name_artist[0]
    new_song
  end

  def self.create_from_filename(song)
    song = Song.new_from_filename(song)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end


# Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift. The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. Separate the artist name from the rest of the data based on the - delimiter. Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.
#
# Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.
#
