module Roarify
  class Finder
    def initialize(klass, id=nil, nested=nil)
      @klass= klass
      @dekorator = @klass.decorator
      @nested_resource = nested
      @id = id
    end

    def find
      find_type
    end

    def find_nested
      nested_representer.get(nested_representer.nested_resource_request(@klass, @id,@nested_resource))
    end

    private
    def find_type
      Error.log "Find Type: #{representer.resource_request(@id)}"
      representer.get(representer.resource_request(@id))
    end

    def nested_representer
      obj = @nested_resource.new
      @nested_resource.decorator.new(obj)
    end

    def representer
      obj = @klass.new
      @dekorator.new(obj)
    end

  end
end
