require 'roar/client'
require 'roarify/shop'
require 'roarify/representer'

module Roarify
  module ShopRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer

    property :city
    property :id

  end
end
