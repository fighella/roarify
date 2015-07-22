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
      themes.first.name.must_equal 'launchpad-star'
    end

    it 'can list all a themes assets' do
      themes = nil
      VCR.use_cassette 'find all themes' do
        themes = Roarify::Theme.all
      end
      assets = nil
      VCR.use_cassette 'find all themes assets' do
        assets = themes.first.assets
      end

      assets.count.must_equal 89
      

    end
  end
end
