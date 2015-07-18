module Roarify
  class ShopDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include ShopRepresenter
    include Representer
    self.api_name = 'shop'
    self.representation_wrap = :shop
  end
end
