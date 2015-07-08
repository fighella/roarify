class SmartCollectionDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include SmartCollectionRepresenter
  include Representer
  self.api_name = 'smart_collections'
  self.representation_wrap = :smart_collection
end
