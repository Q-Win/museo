require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'minitest/autorun'
require 'minitest/pride'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_has_attributes
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_we_can_add_photos
    curator = Curator.new
    photo_1 = {
    id: "1",  name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "1",  year: "1954"}
    photo_2 = {
    id: "2", name: "Moonrise, Hernandez",
    artist_id: "2",year: "1941"}

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_equal 2, curator.photographs.length
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)" ,curator.photographs.first.name
    end

    def test_we_can_add_artists
      curator = Curator.new
      artist_1 = {
      id: "1", name: "Henri Cartier-Bresson",
      born: "1908", died: "2004", country: "France"}
      artist_2 = {
      id: "2", name: "Ansel Adams",
      born: "1902", died: "1984", country: "United States"}

      curator.add_artist(artist_1)
      curator.add_artist(artist_2)

      assert_equal 2, curator.artists.length
      assert_equal "Henri Cartier-Bresson", curator.artists.first.name
    end

    def test_we_can_find_by_artist_id
      curator = Curator.new
      artist_1 = {
      id: "1", name: "Henri Cartier-Bresson",
      born: "1908", died: "2004", country: "France"}
      artist_2 = {
      id: "2", name: "Ansel Adams",
      born: "1902", died: "1984", country: "United States"}

      artist_1 = curator.add_artist(artist_1)
      artist_2 = curator.add_artist(artist_2)

      assert_equal artist_1, curator.find_artist_by_id("1")
      assert_equal artist_2, curator.find_artist_by_id("2")
      assert_equal nil, curator.find_artist_by_id("5")
    end

    def test_we_can_find_photo_by_id
      curator = Curator.new
      photograph_1 = {
      id: "1",  name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",  year: "1954"}
      photograph_2 = {
      id: "2", name: "Moonrise, Hernandez",
      artist_id: "2",year: "1941"}

      photo_1 = curator.add_photograph(photograph_1)
      photo_2 = curator.add_photograph(photograph_2)

      assert_equal photo_2 , curator.find_photograph_by_id("2")
      assert_equal nil, curator.find_photograph_by_id("5")
    end

  end
