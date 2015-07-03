class ProductDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include ProductRepresenter
  self.representation_wrap = :product
end

