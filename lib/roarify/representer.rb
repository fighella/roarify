module Roarify
  module Representer
    def self.included(includer)
      includer.extend(ClassMethods)
    end

    def resource_request(id=nil)
      Roarify::Url.new(self.class.api_name,id).url
    end

    def search_request(options={})
      Roarify::Url.new(self.class.api_name,options).search
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
