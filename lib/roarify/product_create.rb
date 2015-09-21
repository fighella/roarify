module Roarify
  class ProductCreate < Roarify::Product
    attr_reader :handle

    def initialize(product)
      @product = product
      create
    end

    def create
      if @product.changeable? 
        raise Exception.new('Taken Handle')
      end
      create_product
    end

    def create_product
      binding.pry
      representer.post(representer.resource_request)
    end

    def representer
      ProductDecorator.new(@product)
    end

  end
end
