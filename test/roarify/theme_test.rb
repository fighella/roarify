require 'minitest/autorun'
# require 'pry-rescue/minitest'
require 'test_helper'

module Roarify
  class ThemeTest < MiniTest::Spec
    
  def vcr_connect
    VCR.use_cassette 'connect_to_test_shop' do
      DummyStore.test_auth
    end
  end

    it 'finds the themes' do
      vcr_connect
      themes = nil
      VCR.use_cassette 'find all themes' do
        themes = Roarify::Theme.all
      end
      themes.length.must_equal 2
      themes.first.name.must_equal 'launchpad-star'
    end

    it 'can list all a themes assets' do
      vcr_connect
      themes = nil
      VCR.use_cassette 'find all themes' do
        themes = Roarify::Theme.all
      end
      assets = nil
      VCR.use_cassette 'find all themes assets' do
        assets = themes.first.assets
      end

      assets.count.must_equal 93
      

    end
  end
end
