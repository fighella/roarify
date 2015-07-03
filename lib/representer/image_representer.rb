require 'roar/client'
class ImageRepresenter < Roar::Decorator
  include Roar::JSON
  include Roar::Client
  # self.representation_wrap = :image
  property :src
end

