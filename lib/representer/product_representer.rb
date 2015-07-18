require 'roar/client'
require 'representer/variant_decorator'
require 'representer/image_representer'
require 'representer/option_representer'
require 'representer/option_decorator'
require 'roarify/product'
require 'roarify/option'
require 'roarify/variant'
require 'roarify/url'
require 'roarify/image'
require 'roarify/representer'

module Roarify
  module ProductRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    self.api_name = 'product'
    collection :variants, class: Roarify::Variant, decorator: Roarify::VariantDecorator, wrap: false
    collection :images, class: Roarify::Image, decorator: Roarify::ImageRepresenter
    collection :options, class: Roarify::Option, decorator: Roarify::OptionDecorator

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

   
  end
end
