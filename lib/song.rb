require 'pry'

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
    @song = self.new
    @@all << @song
    @song
  end

  def self.new_by_name(name_input)
    newsong = self.new
    newsong.name = name_input
    newsong
  end

  def self.create_by_name(name_input)
    newsong = self.create
    newsong.name = name_input
    newsong
  end

  def self.find_by_name(name_input)
    @@all.detect do |song|
      song.name == name_input
    end
  end

  def self.find_or_create_by_name(name_input)
    self.find_by_name(name_input) ? self.find_by_name(name_input) : self.create_by_name(name_input)
  end

  def self.alphabetical
    # binding.pry
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename)
    newsong = self.new
    no_ext = filename.split(".")[0]
    # binding.pry
    newsong.name = no_ext.split(" - ")[1]
    newsong.artist_name = no_ext.split(" - ")[0]
    newsong
  end

  def self.create_from_filename(filename)
    newsong = self.create
    no_ext = filename.split(".")[0]
    # binding.pry
    newsong.name = no_ext.split(" - ")[1]
    newsong.artist_name = no_ext.split(" - ")[0]
    newsong
  end

  def self.destroy_all
    @@all = []
  end

end
