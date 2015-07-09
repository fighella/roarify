require 'roar/client'
module Roarify
  module OptionRepresenter
    include Roar::JSON
    include Roar::Client
    property :name
  end
end
