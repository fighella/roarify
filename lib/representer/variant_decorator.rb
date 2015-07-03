class VariantDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include VariantRepresenter
  self.representation_wrap = :variant
end
