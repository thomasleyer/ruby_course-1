require 'minitest/autorun'
require './song'

class SongTest < MiniTest::Unit::TestCase
  def test_duration_in_minutes
    song = Song.new("test", 300)
    assert_equal 5, song.duration_in_minutes
  end
end
