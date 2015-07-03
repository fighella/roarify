class ImageDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include ProductRepresenter
  self.representation_wrap = :image
end

