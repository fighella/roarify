module Roarify
  class AssetDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include Representer
    self.api_name = 'assets'
    self.representation_wrap = false 
  end
end

