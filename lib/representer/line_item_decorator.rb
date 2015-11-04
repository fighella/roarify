require 'roar/client'
require 'roarify/line_item'
require 'roarify/representer'


module Roarify
  class LineItemDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include LineItemRepresenter
    include Representer
    self.api_name = 'line_items'
    self.representation_wrap = :false

  end
end
