class VariantDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include VariantRepresenter
  include Representer
  self.api_name = 'variants'
  self.representation_wrap = :variant
end
