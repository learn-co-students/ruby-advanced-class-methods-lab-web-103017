class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    song = self.create
    song.name = name
    song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) if self.find_by_name(name) != nil
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1].split(".")[0]
    artist_name = file_name.split(/[" - ","."]/)[0]
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end


  def self.create_from_filename(file_name)
    song_name = file_name.split(" - ")[1].split(".")[0]
    artist_name = file_name.split(/[" - ","."]/)[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
