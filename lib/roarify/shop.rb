module Roarify
  class Shop
    attr_accessor :id, :city

    def self.find
      ## There is only 1 shop.
      Finder.new(Shop).find
    end

    def self.decorator
      ShopDecorator
    end
 
  end
end
