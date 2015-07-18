require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

module Roarify
  class ThemeTest < MiniTest::Spec
    it 'finds the themes' do
      themes = nil
      VCR.use_cassette 'find all themes' do
        themes = Roarify::Theme.all
      end
      themes.length.must_equal 2
    end
  end
end
