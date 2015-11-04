require 'roar/client'
module Roarify
  module LineItemRepresenter
    include Roar::JSON
    include Roar::Client
    # self.representation_wrap = :image
    [:id, :variant_id, :title, :quantity, :grams, :sku, :variant_title, :vendor, :fulfillment_service, :price, :product_id, :taxable, :requires_shipping, :gift_card, :name, :variant_inventory_management, :properties, :product_exists, :fulfillable_quantity, :total_discount, :fulfillment_status, :tax_lines].map { |p| property p }
    
  end
end

