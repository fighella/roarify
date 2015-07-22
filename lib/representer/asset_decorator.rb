module Roarify
  class AssetDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    # include AssetRepresenter
    include Representer
    self.api_name = 'assets'
    self.representation_wrap = false 
    
    # collection :assets, class: Roarify::Asset, decorator: Roarify::AssetDecorator, wrap: false
    property :key
    
  end
end

