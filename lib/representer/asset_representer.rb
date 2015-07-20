require 'roar/client'
require 'roarify/asset'
require 'representer/asset_decorator'
require 'roarify/representer'

module Roarify
  module AssetRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    self.api_name = 'assets'
    
    collection :assets, class: Roarify::Asset, decorator: Roarify::AssetDecorator, wrap: false
    property :key

  end
end
