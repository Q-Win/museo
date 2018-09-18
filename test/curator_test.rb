require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

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
      artist_hash_1 = {
      id: "1", name: "Henri Cartier-Bresson",
      born: "1908", died: "2004", country: "France"}
      artist_hash_2 = {
      id: "2", name: "Ansel Adams",
      born: "1902", died: "1984", country: "United States"}

      artist_1 = curator.add_artist(artist_hash_1)
      artist_2 = curator.add_artist(artist_hash_2)

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

    def test_we_can_find_photographs_by_artist
      curator = Curator.new
      photo_hash_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
      }

      photo_hash_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
      }

      photo_hash_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
      }

      photo_hash_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
      }

      artist_hash_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
      }

      artist_hash_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
      }

      artist_hash_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
      }

      photo_1 = curator.add_photograph(photo_hash_1)
      photo_2 = curator.add_photograph(photo_hash_2)
      photo_3 = curator.add_photograph(photo_hash_3)
      photo_4 = curator.add_photograph(photo_hash_4)
      artist_1 = curator.add_artist(artist_hash_1)
      artist_2 = curator.add_artist(artist_hash_2)
      artist_3 = curator.add_artist(artist_hash_3)
      diane_arbus = curator.find_artist_by_id("3")

      assert_equal artist_3 ,diane_arbus
      assert_equal [photo_3,photo_4], curator.find_photographs_by_artist(diane_arbus)
    end

    def test_we_get_artists_multiple_photos
      curator = Curator.new
      photo_hash_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
      }

      photo_hash_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
      }

      photo_hash_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
      }

      photo_hash_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
      }

      photo_hash_5 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "1",
      year: "1962"
      }

      artist_hash_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
      }

      artist_hash_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
      }

      artist_hash_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
      }

      photo_1 = curator.add_photograph(photo_hash_1)
      photo_2 = curator.add_photograph(photo_hash_2)
      photo_3 = curator.add_photograph(photo_hash_3)
      photo_4 = curator.add_photograph(photo_hash_4)
      photo_5 = curator.add_photograph(photo_hash_5)
      artist_1 = curator.add_artist(artist_hash_1)
      artist_2 = curator.add_artist(artist_hash_2)
      artist_3 = curator.add_artist(artist_hash_3)
      
      assert_equal [artist_1, artist_3], curator.artists_with_multiple_photographs
    end

  end
