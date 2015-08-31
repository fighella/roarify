require 'roar/client'
require 'roarify/variant'
require 'roarify/image'
require 'roarify/representer'

module Roarify
  module VariantRepresenter
    include Roar::JSON
    include Roarify::Representer
    self.api_name = 'variants'

    property :id 
    property :sku
    property :option1
    property :option2
    property :price
    property :title
    property :barcode
    property :weight
    property :weight_unit
    property :grams
    property :inventory_policy
    property :inventory_management
    property :inventory_quantity
    property :old_inventory_quantity
    property :fulfillment_service

    def update
      put(resource_request(represented.id).url)
    end

    # variants
    # { "barcode" : "1234_pink" }
    # { "compare_at_price" : "null" }
    # { "created_at" : "2012-08-24T14:01:47-04:00" }
    # { "fulfillment_service" : "manual" }
    # { "grams" : 200 }
    # { "weight" : 0.2 }
    # { "weight_unit" : "kg" }
    # { "id" : 808950810 }
    # { "inventory_management" : "shopify" }
    # { "inventory_policy" : "continue" }
    # { "inventory_quantity" : 10 }
    # { "option1" : "Pink" }
    # { "position" : "1" }
    # { "price" : 199.99 }
    # { "product_id" : 632910392 }
    # { "requires_shipping" : true }
    # { "sku" : "IPOD2008PINK" }
    # { "taxable" : true }
    # { "title" : "Pink" }
    # { "updated_at" : "2012-08-24T14:01:47-04:00" }
    # A list of variant objects, each one representing a slightly different version of the product. For example, if a product comes in different sizes and colors, each size and color permutation (such as "small black", "medium black", "large blue"), would be a variant.
    # To reorder variants, update the product with the variants in the desired order. The position attribute on the variant will be ignored.

  end
end
