require 'roar/client'
require 'representer/variant_representer'
require 'representer/image_representer'
require 'representer/option_representer'
require 'product'
require 'option'
require 'variant'
require 'request'
require 'image'

module ProductRepresenter
  include Roar::JSON
  include Roar::Client
  ## when accessing Product through SEARCH, it does not "self wrap" each product...
  # self.representation_wrap = :product
 
  collection :variants, class: Variant, decorator: VariantRepresenter
  collection :images, class: Image, decorator: ImageRepresenter
  collection :options, class: Option, decorator: OptionRepresenter
 
  property :title
  property :id
  property :vendor
  property :created_at
  property :body_html
  property :handle
  property :images
  property :options
  property :product_type
  property :published_at
  property :published
  property :published_scope
  property :tags
  property :template_suffix
  property :updated_at
  property :barcode
  property :compare_at_price
  property :created_at
  property :fulfillment_service
  property :grams
  property :weight
  property :weight_unit
  property :inventory_management
  property :inventory_policy
  property :inventory_quantity
  property :metafield

  def find(id)
    get(resource_request(id).url)
  end

  def self.update
    put(resource_request(id).url)
  end

  def find_by(attribute, title)
    get(resource_request.search(attribute.to_s,title))
  end

  def shopify_url
    resource_request.url
  end

  def resource_request(id=nil)
    Request.new('products',id)
  end
end
