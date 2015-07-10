require 'roar/client'
require 'roarify/smart_collection'
require 'representer/collection_rule_representer'
require 'representer/collection_rule_decorator'
require 'roarify/representer'

module Roarify
  module SmartCollectionRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    self.api_name = 'smart_collection'
    collection :rules, class: Roarify::CollectionRule, decorator: Roarify::CollectionRuleDecorator, wrap: false

    property :title
    property :id

  end
end
