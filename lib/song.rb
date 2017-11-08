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
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      song_object = self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by!{ |song_instance| song_instance.name }
  end

  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    new_song = Song.new_by_name(filename[1].gsub('.mp3', ''))
    new_song.artist_name = filename[0]
    new_song
    #binding.pry
  end

  def self.create_from_filename(filename)
    filename = filename.split(' - ')
    new_song = self.new_by_name(filename[1].gsub('.mp3', ''))
    new_song.artist_name = filename[0]
    new_song
  end

  def self.destroy_all
    @@all = []
  end


end
