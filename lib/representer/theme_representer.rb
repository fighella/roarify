require 'roar/client'
require 'representer/asset_decorator'
require 'representer/asset_representer'
require 'roarify/asset'
require 'roarify/theme'
require 'roarify/url'
require 'roarify/representer'

module Roarify
  module ThemeRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    self.api_name = 'theme'

    property :id
    property :name

  end
end

