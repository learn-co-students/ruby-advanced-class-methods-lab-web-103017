require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = '')
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

def self.new_by_name (name)
  song = Song.new
  song.name = name
  song
end

  def self.create_by_name (name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name (name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

    def self.alphabetical
      arr = @@all.collect {|song| song}
      arr.sort_by {|song| song.name}
    end

    def self.new_from_filename(file)
      mp3_title = file.split(" - ")[1]
      title = mp3_title.split(".")[0]
      song = Song.new(title)
      song.artist_name = file.split(" - ")[0]
      song
    end

    def self.create_from_filename(file)
      mp3_title = file.split(" - ")[1]
      title = mp3_title.split(".")[0]
      song = Song.new(title)
      song.artist_name = file.split(" - ")[0]
      song.save
    end

    def self.destroy_all
      @@all = []
    end

end
