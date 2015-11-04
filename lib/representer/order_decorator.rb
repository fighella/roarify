require 'roar/client'
require 'roarify/order'
require 'roarify/representer'


module Roarify
  class OrderDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include OrderRepresenter
    include Representer
    self.api_name = 'orders'
    self.representation_wrap = :order
    
    # collection :line_items, class: Roarify::LineItem, decorator: Roarify::LineItemDecorator, wrap: false

  end
end
