module Roarify
  class SmartCollection
    attr_accessor :body_html, :handle, :id, :image, :published_at, :rules, :published_scope, :relation, :sort_order, :title

    def create
      representer = Roarify::SmartCollectionDecorator.new(self)
      representer.post(representer.resource_request)
    end

  end
end
