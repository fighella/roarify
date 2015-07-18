module Roarify
  class Search
    attr_accessor :id, :handle, :products
    def initialize(klass)
      @klass = klass
    end

    def all
      representer.get(representer.resource_request(@klass.decorator.api_name).url)
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

