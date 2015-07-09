require 'roar/client'
require 'roarify/variant'
require 'roarify/image'
require 'roarify/representer'

module Roarify
class VariantDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include Roarify::Representer
  self.api_name = 'variants'
  self.representation_wrap = :variant
  
  property :id 
  property :sku
  property :option1
  property :option2
  property :price
  property :title
  property :barcode
  property :inventory_quantity
  property :old_inventory_quantity

  def update
    #
    #put(resource_request(represented.id).url)
  end

end
end
