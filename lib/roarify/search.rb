module Roarify
  class Search
    attr_accessor :id, :handle
    def initialize(klass, filter=nil)
      @klass = klass
      @filter = filter
    end

    def all(parent_class=nil, parent_id=nil, opts={})
      if parent_class && parent_id
        representer.get(representer.resource_request(@klass.decorator.api_name, parent_id, parent_class.decorator.api_name).url)
      else
        if @filter
          representer.get(representer.resource_request(@klass.decorator.api_name, @filter).url)
        else
          representer.get(representer.resource_request(@klass.decorator.api_name).url)
        end
      end
    end

    def find_by(attribute, value)
      representer.get(representer.resource_request(@klass.decorator.api_name).search(attribute.to_s,value))
    end

    def representer
      search = OpenStruct.new
      SearchRepresenter.new(search)
    end

  end
end

