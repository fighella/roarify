module Roarify
  class ProductCreate < Roarify::Product
    def initialize(product)
      @product = product
      create
    end

    def create
      if changeable? 
        if handle_taken?
          raise 'Taken Handle'
        end
      end
      create_product
    end

    def create_product
      representer.post(representer.resource_request.url)
    end

    def representer
      ProductDecorator.new(@product)
    end

  end
end
