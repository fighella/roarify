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
        themes.first.assets
      end

     puts assets.inspect
     raise themes.first
      puts "argh"
      # puts assets.count
      

    end
  end
end
