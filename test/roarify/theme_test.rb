require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

module Roarify
  class ThemeTest < MiniTest::Spec
    it 'finds the themes' do
      themes = nil
      VCR.use_cassette 'find all themes' do
        themes = Roarify::Theme.find_all
      end
      puts "Themes: #{themes.inspect}"
      # themes.length.must_be_greater_than 0
    end
  end
end
