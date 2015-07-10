module Roarify
  class Product
    attr_accessor :id, :body_html, :title, :vendor, :handle, :product_type, :variants, :images, :created_at, :handle, :body_html, :images, :options,:product_type,:published_at,:published_scope,:published, :tags,:template_suffix,:title,:updated_at,:barcode,:compare_at_price,:created_at,:fulfillment_service,:grams,:weight,:weight_unit,:inventory_management,:inventory_policy,:inventory_quantity,:metafield,:vendor

    def self.find(id)
      representer = ProductDecorator.new(self.new)
      representer.get(representer.resource_request(id).url)
    end
    
    def self.find_by_ids(ids)
      ids.each.map { |id| Product.find(id) }
    end

    def save
      representer = ProductDecorator.new(self)
      representer.post(representer.resource_request.url)
    end

    def self.where(attribute, value)
      search = OpenStruct.new
      representer = SearchRepresenter.new(search)
      representer.get(representer.resource_request.search(attribute,value))
      ## Returns an array of id's
      Product.find_by_ids(representer.represented.products.map {|p| p.id })
    end

    def self.where_first_or_initialize(attribute,value)
      if where(attribute,value).any?
        product = Product.where(attribute,value).first
      else
        product = Product.new
        if attribute == 'handle'
          product.handle = value
        end
      end
    end

    def delete
      representer = ProductDecorator.new(self)
      representer.delete(representer.resource_request(id).url)
    end


    def update
      product = self
      if self.variants
        ## well don't do anything yet 
      else
        ## if no variants dont send the variants back with a product update?
        product.variants = nil
      end
      representer = ProductDecorator.new(product)
      if self.id
        begin
          representer.put(representer.resource_request(self.id).url)
        rescue 
          'Probably trying to save a duplicate'
        end
      else
        representer.post(representer.resource_request.url)
      end
    end

  end
end
