require './lib/photograph'
require './lib/artist'

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


end
