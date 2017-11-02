class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << Song.new
    return @@all.last
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)
    return @@all.last
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    file = filename[0...-4].split(/-/)
    new_song = Song.new
    new_song.name = file[1].strip
    new_song.artist_name = file[0].strip
    return new_song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end


