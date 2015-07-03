require 'roar/client'

module OptionRepresenter
  include Roar::JSON
  include Roar::Client
  property :name
end
