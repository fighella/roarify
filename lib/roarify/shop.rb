# require 'net/http'
# require 'net/https'
# require 'dummy/dummy_store'
# require 'representer/shop_representer'
# require 'roarify/finder'
# 
module Roarify
  class Shop
    attr_accessor :id, :city

    def self.find
      Finder.new(Shop).find
    end

    def self.decorator
      ShopDecorator
    end
 
  end
end
