module Roarify
  class ThemeDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    #include ThemeRepresenter
    include Representer
    self.api_name = 'themes'
    self.representation_wrap = false
    
    # def themes
    #   [self.represented]
    # end

  end
end
