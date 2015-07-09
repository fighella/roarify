module Roarify
class CollectionRuleDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include CollectionRuleRepresenter
  include Roarify::Representer
  self.api_name = 'rules'
  self.representation_wrap = false
end
end

