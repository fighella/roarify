module Roarify 
  class Theme
    attr_accessor :id

    def self.find(id)
      Finder.new(Theme,id).find
    end

    def self.all
      search = Roarify::Search.new(Theme).all
      search.themes.map { |t| t.id }
    end

    def self.decorator
      ThemeDecorator
    end

  end
end
