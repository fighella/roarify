require 'roar/client'
require 'representer/variant_decorator'
require 'representer/image_representer'
require 'representer/option_representer'
require 'representer/option_decorator'
require 'product'
require 'option'
require 'variant'
require 'url'
require 'image'
require 'representer'

module ProductRepresenter
  include Roar::JSON
  include Roar::Client
  include Representer
  self.api_name = 'product'
  ## when accessing Product through SEARCH, it does not "self wrap" each product...
  # self.representation_wrap = :product
 
  collection :variants, class: Variant, decorator: VariantDecorator, wrap: false
  collection :images, class: Image, decorator: ImageRepresenter
  collection :options, class: Option, decorator: OptionDecorator
 
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

  def find!(id)
    find
    rescue 
    'NOOO!'
  end

  def update
    put(resource_request(represented.id).url)
  rescue
    'AHH!'
  end

  def create
    post(resource_request(represented.id).url)
  rescue
    'Duplicate'
  end


  def find_by(attribute, title)
    search = OpenStruct.new
    representer = SearchRepresenter.new(search)
    representer.get(resource_request.search(attribute.to_s,title))
    puts search.inspect
  end

  def where_first_or_create(attribute,title)
    puts where(attribute, title).inspect
    if where(attribute,title).to_s #represented #.any?
      first
    else
      create(resource_request(represented.id).url)
    end
  end
  #
  # def shopify_url
  #   resource_request.url
  # end

  # def resource_request(id=nil)
  #   Url.new(self.class.api_name,id)
  # end
end
