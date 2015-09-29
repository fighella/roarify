require 'roar/client'
require 'roarify/representer'

module Roarify
  module OrderRepresenter
    include Roar::JSON
    include Roar::Client
    include Representer
   
    property :id
    property :email
    property :total_price
  end
end
