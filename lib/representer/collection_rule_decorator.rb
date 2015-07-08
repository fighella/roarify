class CollectionRuleDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include CollectionRuleRepresenter
  include Representer
  self.api_name = 'rules'
  self.representation_wrap = false
end

