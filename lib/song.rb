require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end


  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
    song.name = name
    song
  end

  def self.create_by_name(name)
    #This one doesn't work
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    #refeactor
    file_arr = filename.split(" - ")
    song_arr = file_arr[1].split(".")
    song_name = song_arr[0]
    song = Song.create_by_name(song_name)
    song.artist_name = file_arr[0]
    song
  end

  def self.create_from_filename(filename)
    file_arr = filename.split(" - ")
    song_arr = file_arr[1].split(".")
    song_name = song_arr[0]
    song = Song.find_or_create_by_name(song_name)
    song.artist_name = file_arr[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
