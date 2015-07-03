require 'shop'
class Request
  def initialize(resource, id=nil)
    @resource = resource
    @id = id
    set_request_type
  end

  def url
    original_uri = connect[:uri]
    fixed_uri = original_uri + resource + '.json'
    connect.merge({uri: fixed_uri})
  end

  def search(attribute,query)
    start_url = url
    original_uri = url[:uri]
    search_url = original_uri + '?' + attribute + '=' + query
    start_url.merge({uri: search_url})
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
    Shop.new.connect
  end

  def set_request_type
    if @id.nil?
      @collection = true
    else
      @member = @id.to_s
    end
  end

  def resource
    @collection ? @resource : @resource + '/' + @member 
    ## pluralize is rails
  end

end
