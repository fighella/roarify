module Roarify
  class ProductUpdate < Product
    def initialize(product)
      @product = product
      update
    end

    def representer
      ProductDecorator.new(product_data)
    end

    def update
      if @product.changeable?
        raise 'Taken Handle'
      else
        representer.put(representer.resource_request(@product.id))
      end
    end

    def product_data
      if @product.exists?
        @product.variants = merge_variants
      end
      @product
    end

    def merge_variants
      ## hang onto this for now
      safe_variants.any? ? @product.variants.select { |v| !v.nil? and v.option1 } : nil
    end

    def safe_variants
      has_variants? ? @product.variants.select { |v| !v.nil? and v.option1 } : []
    end

    def has_variants?
      @product.variants and @product.variants.any?
    end

  end
end
