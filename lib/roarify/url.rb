module Roarify
  class Url
    def initialize(resource, id=nil, nested_resource=nil, nested_id=nil, opts=nil)
      @resource = resource
      @id = id
      @nested_resource = nested_resource
      @nested_id = nested_id
      @opts = opts
      set_request_type!
    end

    def url
      original_uri = connect[:uri]
      fixed_uri = original_uri + resource + '.json'
      if @opts and !@opts.empty?
        fixed_uri = fixed_uri + '?' + @opts
      end
      connect.merge({uri: fixed_uri})
    end

    def search(attribute,query)
      start_url = url
      original_uri = url[:uri]
      search_url = original_uri + '?' + attribute + '=' + query + '&fields=id'
      start_url.merge({uri: search_url})
    end

    def filter(ids)
      search('ids',ids.join(','))
    end

    def update
      if @member
        # do some stuff. can't update a collection bra'
      else
        raise 'Cannot update a collection.'
      end
    end


    private
    def connect
      Connect.auth.connection
    end

    def set_request_type!
      unless @id.nil?
        @member = @id.to_s
      else
        @collection = true
      end
    end

    def resource
      [@resource,@member,@nested_resource].select { |r| r && !r.nil? }.join('/')
    end

  end
end
