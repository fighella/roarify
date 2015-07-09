require 'roar/client'
require 'roarify/representer'
require 'roarify/collection_rule'

module Roarify
  module CollectionRuleRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    self.api_name = 'rules'

    property :column
    property :relation
    property :condition

    # "column": "title",
    # "relation": "starts_with",
    # "condition": "iPod"

  end
end

