class ProductDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include ProductRepresenter
  include Representer
  self.representation_wrap = :product
end

