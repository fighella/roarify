module Roarify
  class Variant
    attr_accessor :id, :sku, :option1, :option2, :price, :title, :barcode, :inventory_quantity, :old_inventory_quantity, :inventory_management, :weight, :weight_unit, :grams

    def self.find(id)
      Finder.new(Variant,id).find
    end



  end
end
