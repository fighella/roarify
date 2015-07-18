module Roarify
  class Finder
    
    def initialize(klass, id=nil)
      @klass= klass
      @dekorator = @klass.decorator
      @id = id
    end

    def find
      find_type
    end

    private

    def find_type
        representer.get(representer.resource_request(@id))
    end

    def representer
      obj = @klass.new
      @dekorator.new(obj)
    end


  end
end
