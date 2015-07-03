class ImageDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include ImageRepresenter
  self.representation_wrap = :image
end

