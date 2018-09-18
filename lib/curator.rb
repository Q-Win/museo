require './lib/photograph'
require './lib/artist'
require "csv"

class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    photo_to_add = Photograph.new(photo)
    @photographs << photo_to_add
    photo_to_add
  end

  def add_artist(artist)
    artist_to_add = Artist.new(artist)
    @artists << artist_to_add
    artist_to_add
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def find_photograph_by_id(id)
    @photographs.find {|photographs| photographs.id == id}
  end

  def find_photographs_by_artist(artist)
    artist_id = artist.id
    @photographs.find_all{|photograph| photograph.artist_id == artist_id}
  end

  def artists_with_multiple_photographs
    @artists.find_all{|artist| find_photographs_by_artist(artist).length >= 2}
  end

  def artists_by_country(string)
    @artists.find_all{|artist| artist.country == string}
  end

  def photographs_taken_by_artists_from(string)
    artists_by_country(string).map do |artist|
      find_photographs_by_artist(artist)
    end.flatten
  end

  def load_photographs(path)
    total_photos = CSV.read(path, headers: true, header_converters: :symbol)
    total_photos.each do |photo|
      photograph = Photograph.new({:id => photo[:id], :name => photo[:name],
                    :artist_id => photo[:artist_id],
                    :year => photo[:year]})
      @photographs << photograph
    end

  end

  def load_artists(path)
    total_artists = CSV.read(path, headers: true, header_converters: :symbol)
    total_artists.each do |artist|
      artist = Artist.new({:id => artist[:id], :name => artist[:name],
                    :born => artist[:born], :died => artist[:died],
                    :country => artist[:country]})
      @artists << artist
    end
  end

  def photographs_taken_between(range)
    range_array = range.to_a
    @photographs.find_all {|photo|
      photo.year.to_i.between?(range_array[0],range_array[-1]) == true}
  end

  def artists_photographs_by_age(artist)
    artist_birth_year = artist.born.to_i
    artist_photos = find_photographs_by_artist(artist)
    artist_hash = {}
    artist_photos.each do |photo|
      age = photo.year.to_i - artist_birth_year
      artist_hash[age] = photo.name
    end
    artist_hash
  end

end
