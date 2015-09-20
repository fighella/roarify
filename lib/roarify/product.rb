module Roarify
  class Product
    attr_accessor :id, :body_html, :title, :vendor, :handle, :product_type, :variants, :images, :created_at, :handle, :body_html, :images, :options,:product_type,:published_at,:published_scope,:published, :tags,:template_suffix,:title,:updated_at,:barcode,:compare_at_price,:created_at,:metafield,:vendor

    def self.find(id)
      Finder.new(Product,id).find
    end
    
    def save
      if exists?
        begin
          Roarify::ProductUpdate.new(self)
        rescue Exception => e
          Error.new(e)
        end
      else
        begin
          Roarify::ProductCreate.new(self)
        rescue Exception => e
          Error.new(e)
        end
      end
    end

    def self.where(attribute, value)
      find_by_ids(Search.new(Product).find_by(attribute,value).products.map { |v| v.id })
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
      representer.delete(representer.resource_request(id))
    end

    def exists?
      ## If it's already a Shopify Product it will return with an ID apparently
      self.id
    end

    def handle_taken?
      Search.new(Product).find_by('handle', handle).any?
    end

    def changeable?
      ## Shopify will change handles even if you specificy what you'd like / ie: dupes
      handle and Product.where('handle',handle).any? and ids_match
    end

    def ids_match
      !id or Product.where('handle',handle).first.id != id
    end

    def self.find_by_ids(ids)
      ids.each.map { |id| Product.find(id) }
    end

    def self.decorator
      ProductDecorator
    end

  end
end
