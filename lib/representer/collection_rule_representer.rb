require 'roar/client'
require 'representer'
require 'collection_rule'

module CollectionRuleRepresenter
  include Roar::JSON
  include Roar::Client
  include Representer
  self.api_name = 'rules'
 
  property :column
  property :relation
  property :condition

# "column": "title",
# "relation": "starts_with",
# "condition": "iPod"
  
end

