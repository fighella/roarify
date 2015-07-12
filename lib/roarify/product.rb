module Roarify
  class Product
    attr_accessor :id, :body_html, :title, :vendor, :handle, :product_type, :variants, :images, :created_at, :handle, :body_html, :images, :options,:product_type,:published_at,:published_scope,:published, :tags,:template_suffix,:title,:updated_at,:barcode,:compare_at_price,:created_at,:fulfillment_service,:grams,:weight,:weight_unit,:inventory_management,:inventory_policy,:inventory_quantity,:metafield,:vendor


    def self.find(id)
      representer = ProductDecorator.new(self.new)
      product = representer.get(representer.resource_request(id).url)
      product
    end
    
    def self.find_by_ids(ids)
      ids.each.map { |id| Product.find(id) }
    end

    def save
      representer = ProductDecorator.new(product_data)
      if exists?
        update(representer)
      else
        create(representer)
      end
    end

    def exists?
      ## If it's already a Shopify Product it will return with an ID apparently
      self.id
    end

    def create(representer)
      if self.changeable?
        raise 'Set field will change.'
      else
        representer.post(representer.resource_request.url)
      end
    end

    def update(representer)
      if self.changeable?
        raise 'Set will change.'
      else
        representer.put(representer.resource_request(self.id).url)
      end
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



    def changeables
      [:handle]
    end

    def changeable?
      (exists? and self.handle and Product.where('handle',self.handle).any? and Product.where('handle',self.handle).first.id != self.id) or
      (!exists? and self.handle and Product.where('handle',self.handle).any?)
    end

    def product_data
      # raise 'Hell'
      if exists?
        self.variants = merge_variants
      end
      self
    end

    def merge_variants
      ## hang onto this for now
      safe_variants.any? ? self.variants.select { |v| !v.nil? and v.option1 } : nil
    end

    def safe_variants
      has_variants? ? self.variants.select { |v| !v.nil? and v.option1 } : []
    end

    def has_variants?
      self.variants and self.variants.any?
    end

  end
end
