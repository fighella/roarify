require 'roar/client'
require 'smart_collection'
require 'representer/collection_rule_representer'
require 'representer/collection_rule_decorator'
require 'representer'

module SmartCollectionRepresenter
  include Roar::JSON
  include Roar::Client
  include Representer
  self.api_name = 'smart_collections'
  collection :rules, class: CollectionRule, decorator: CollectionRuleDecorator, wrap: false
 
  property :title
  property :id
  
  def create
    # puts resource_request.to_s
    # puts resource_request.url
    post(resource_request.url)
  end

end
