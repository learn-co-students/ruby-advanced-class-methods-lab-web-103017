require "pry"

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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |x| x.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{ |item| item.name }
  end

  def self.new_from_filename(name)
    song = self.create
    new_name = name.chomp('.mp3').split(" - ")
    song.name = new_name[1]
    song.artist_name = new_name[0]
    song
    # binding.pry
  end

  def self.create_from_filename(name)
    song = self.create
    new_name = name.chomp('.mp3').split(" - ")
    song.name = new_name[1]
    song.artist_name = new_name[0]
    song
  end

  def self.destroy_all
    @@all = []
  end
end
