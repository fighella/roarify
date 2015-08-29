module Roarify
  class ProductDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include ProductRepresenter
    include Representer
    self.api_name = 'products'
    self.representation_wrap = :entry
   
  end
end

