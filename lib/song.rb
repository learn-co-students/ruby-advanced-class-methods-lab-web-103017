require 'pry'
class Song
  attr_accessor :name, :artist_name #read and write
  @@all = [] #will store all the data


  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    new_song_by_name = self.create
    new_song_by_name.name = title
    new_song_by_name
  end

  def self.create_by_name(name_of_song)
    self.new_by_name(name_of_song)
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(file)
    artist = file.split(' - ')[0]
    song_name = file.split(' - ')[1].split('.')[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all # this is a class method calling a class variable for all the data
  end

  def save
    self.class.all << self #instance method, putting itself to the class variable self
  end

end
