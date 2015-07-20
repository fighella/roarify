module Roarify
  class Asset
    attr_accessor :key #,  :assets
    def self.all
      ## Can't work with assets / must be nested.
      # search = Roarify::Search.new(Asset).all
      # search.assets.map { |t| t.id }
    end

    def self.decorator
      AssetDecorator
    end

  end
end
