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
