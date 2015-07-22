module Roarify 
  class Theme
    attr_accessor :id, :name

    def self.find(id)
      Finder.new(Theme,id).find
    end

    def self.all
      search = Roarify::Search.new(Theme).all
      find_by_ids( search.themes.map { |t| t.id } )
    end

    def assets
      Asset.all(id)
    end

    def self.decorator
      ThemeDecorator
    end

    def self.find_by_ids(ids)
      ids.each.map { |id| Theme.find(id) }
    end


  end
end
