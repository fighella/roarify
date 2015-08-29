require 'minitest/autorun'
# require 'pry-rescue/minitest'
require "test_helper"

class RoarifyTest < MiniTest::Spec
  def test_exists
    assert Roarify::ProductTest
  end
end
