module Roarify 
  class Theme
    attr_accessor :id

    def self.find_all
      theme = Theme.new
      representer = ThemeDecorator.new(theme)
      representer.get(representer.resource_request.url)
      
      # representer
      raise 'Hell'
    end

  end
end
