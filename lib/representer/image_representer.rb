require 'roar/client'
module Roarify
  module ImageRepresenter
    include Roar::JSON
    include Roar::Client
    # self.representation_wrap = :image
    property :src
  end
end

