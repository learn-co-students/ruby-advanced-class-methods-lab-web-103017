# require 'pry'
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
   song=Song.new
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
   @@all.detect{|n| n.name==name}
 end

 def self.find_or_create_by_name(name)
   if find_by_name(name) != nil
     self.find_by_name(name)
    else
      create_by_name(name)
    end

 end

 def self.alphabetical
   self.all.sort_by { |song| song.name }
 end

 def self.new_from_filename(filename)
   song=Song.new
   string=filename.chomp(".mp3")
   str=string.split(" - ")
   song.artist_name=str[0]
   song.name=str[1]
   song
 end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end


 def self.destroy_all
   self.all.clear
 end


end
