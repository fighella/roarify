module Roarify
  module Representer
    def self.included(includer)
      includer.extend(ClassMethods)
    end

    def resource_request(id=nil)
      Roarify::Url.new(self.class.api_name,id).url
    end

    def nested_resource_request(base, id, nested_resource, nested_id=nil)
      Roarify::Url.new(base.decorator.api_name, id, nested_resource.decorator.api_name, nested_id).url
    end

    module ClassMethods
      def api_name
        @api_name
      end

      def api_name=(name)
        @api_name = name
      end
    end
  end
end
