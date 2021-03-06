require 'roar/client'
require 'representer/product_representer'
require 'representer/variant_representer'
require 'representer/image_representer'
require 'representer/theme_representer'
require 'representer/order_representer'
module Roarify
  class SearchRepresenter < Roar::Decorator
    include Roar::JSON
    include Roar::Client
    collection :products, class: OpenStruct, decorator: Roarify::ProductRepresenter
    collection :themes, class: OpenStruct, decorator: Roarify::ThemeRepresenter
    collection :assets, class: OpenStruct, decorator: Roarify::AssetRepresenter
    collection :variants, class: OpenStruct, decorator: Roarify::VariantRepresenter
    collection :orders, class: OpenStruct, decorator: Roarify::OrderRepresenter

    property :id
    property :title
    property :handle

    def resource_request(resource=nil,opts={})
      Roarify::Url.new(resource,nil,nil, nil, opts)
    end
  end
end

