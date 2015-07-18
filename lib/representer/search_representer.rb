require 'roar/client'
require 'representer/product_representer'
require 'representer/variant_representer'
require 'representer/image_representer'
require 'representer/theme_representer'
module Roarify
  class SearchRepresenter < Roar::Decorator
    include Roar::JSON
    include Roar::Client
    collection :products, class: OpenStruct, decorator: Roarify::ProductRepresenter
    collection :themes, class: OpenStruct, decorator: Roarify::ThemeRepresenter
    # collection :images, class: OpenStruct, decorator: ImageRepresenter

    property :id
    property :title
    property :handle

    def resource_request(resource=nil)
      Roarify::Url.new(resource)
    end
  end
end

