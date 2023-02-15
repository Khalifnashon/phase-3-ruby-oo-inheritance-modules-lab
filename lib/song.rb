require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  # creates a class variable called @@songs, which is an array that will hold all 
  # of the song objects that are created.
  @@songs = []
  # The initialize method is a special method in Ruby that gets called when a new 
  # object is created from a class.The initialize method is used to initialize the 
  # state of a newly created song object by adding it to the @@songs array.
  # This means that every time a new song object is created, it will 
  # automatically be added to the @@songs array, which is a useful way 
  # to keep track of all the song objects that have been created.
  def initialize
    @@songs << self
  end

  def self.find_by_name(name)
    # checks if the name attribute of the song object a matches the name 
    # argument passed to the method.
    @@songs.detect{|a| a.name == name}
  end

  # returns the entire list of songs array
  def self.all
    @@songs
  end

  # class method that clears the @@songs array
  def self.reset_all
    self.all.clear
  end

  # returns the number of song objects in the @@songs array.
  def self.count
    self.all.count
  end

  # instance method that sets the artist attribute of the current song object.
  def artist=(artist)
    @artist = artist
  end

  # is an instance method that returns a URL-friendly version of the name
  #  attribute (i.e. with spaces replaced by hyphens).
  def to_param
    name.downcase.gsub(' ', '-')
  end
end


# The reason attr_reader is used instead of attr_accessor for the artist attribute is
# because the artist attribute should only be set once when a song object is created, 
# and then it should be read-only. This is because the artist attribute is typically 
# considered to be a fixed property of a song, and it doesn't make sense to change the
# artist of a song after it has been created.
# artist of a song object can only be set once during initialization, and then can only
#  be read afterward.

Song.all.each do |song|
  puts "Name: #{song.name}, Artist: #{song.artist}"
end
# This will output the name and artist of each song in the list. Note that 
# the artist attribute is read-only, so you can only retrieve its value using
# the attr_reader method.

