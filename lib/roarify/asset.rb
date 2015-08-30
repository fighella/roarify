module Roarify
  class Asset
    attr_accessor :key #,  :assets
    def initializer(parent_id)
      @parent_id = parent_id
    end

    def self.all(parent_id)
      search = Roarify::Search.new(Asset).all(Theme, @parent_id)
      search.assets
    end

    def self.decorator
      Roarify::AssetDecorator
    end

    def self.parent
      Theme
    end

  end
end
