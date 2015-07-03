require 'roar/client'
require 'representer/product_representer'
require 'representer/variant_representer'
require 'representer/image_representer'
class SearchRepresenter < Roar::Decorator
  include Roar::JSON
  include Roar::Client
  collection :products, class: OpenStruct, decorator: ProductRepresenter
  # collection :variants, class: OpenStruct, decorator: VariantRepresenter
  # collection :images, class: OpenStruct, decorator: ImageRepresenter
 
  property :id
  property :title
  property :handle

  def find_by(attribute, title)
    get(resource_request.search(attribute.to_s,title))
  end

  def url
    get(shopify_url)
  end

  def shopify_url
    resource_request.url
  end

  def resource_request
    ## just use products for now
    Request.new('products')
  end
end

