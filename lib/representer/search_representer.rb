require 'roar/client'
require 'representer/product_representer'
require 'representer/variant_representer'
require 'representer/image_representer'
module Roarify
  class SearchRepresenter < Roar::Decorator
    include Roar::JSON
    include Roar::Client
    collection :products, class: OpenStruct, decorator: Roarify::ProductRepresenter
    # collection :themes, class: OpenStruct, decorator: Roarify::ThemeRepresenter
    # collection :images, class: OpenStruct, decorator: ImageRepresenter

    property :id
    property :title
    property :handle

    def find_by(attribute, title)
      search = represented
      representer = Roarify::SearchRepresenter.new(search)
      VCR.use_cassette "search_#{attribute}_for_#{title}" do
        representer.get(resource_request.search(attribute.to_s,title))
      end
      # get(resource_request.search(attribute.to_s,title))
    end

    def url
      get(shopify_url)
    end

    def shopify_url
      resource_request.url
    end

    def resource_request(resource='products')
      ## just use products for now
      Roarify::Url.new(resource)
    end
  end
end

