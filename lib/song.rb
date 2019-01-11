require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name,artist_name=nil)
    @name=name
    @artist_name= artist_name
    @@all << self
  end

   def self.create
   new_song=self.new(name)
   new_song.save
   new_song
  end

  def self.create_by_name(name)
  create_song=self.new_by_name(name)
  create_song.save
  create_song
  end

  def self.find_by_name(name)
    @@all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
      self.create_by_name(name)
     else
       self.find_by_name(name)
     end
end


  def self.alphabetical
   songs_in_order = @@all.sort_by {|x|x.name}
   songs_in_order.uniq!
  end

#   def self.new_from_filename(filename)
#
# end


  def self.new_by_name(name)
    song_name=Song.new(name)
    song_name
  end



  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  # def self.alphabetical
  #   @@all.sort
  # end

def self.new_from_filename(filename)
  new_file_array=filename.chomp(".mp3").split("-")
  name=new_file_array[1].strip!
  artist_name=new_file_array[0].strip!
  new_song =self.new(name,artist_name)
  #binding.pry
  #new_song.artist_name=(new_artist_name)
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
  #binding.pry
end
end
