require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/paramable'
require_relative '../lib/concerns/findable'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    @songs = []
  end

  # def self.find_by_name(name)
  #   @@artists.detect{|a| a.name == name}
  # end

  def self.all
    @@artists
  end

  extend Memorable::ClassMethods, Findable
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   self.all.count
  # end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
