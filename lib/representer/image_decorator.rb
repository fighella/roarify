module Roarify
  class ImageDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include Roarify::ImageRepresenter
    self.representation_wrap = :image
  end
end

