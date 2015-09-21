module Roarify
  class Variant
    attr_accessor :id, :sku, :option1, :option2, :price, :title, :barcode, :inventory_quantity, :old_inventory_quantity, :inventory_management, :weight, :weight_unit, :grams, :inventory_policy, :fulfillment_service, :inventory_quantity_adjustment

    def self.find(id)
      Finder.new(Roarify::Variant,id).find
    end

    def update
      representer.put(representer.resource_request(id))
    end

    def self.decorator
      VariantDecorator
    end

    def representer
      VariantDecorator.new(self)
    end


  end
end
