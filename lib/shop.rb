require 'net/http'
require 'net/https'
require 'dummy/dummy_store'

class Shop
  def initialize(api_key=nil, password=nil, shop_domain=nil)
    @api_key = api_key
    @password = password
    @shop_domain = shop_domain
    dev_settings
  end

  def connect
    authed_request
  end

  private
  def shop_admin_url
    "https://#{@shop_domain}/admin/"
  end

  def authed_request
    { 
      uri: shop_admin_url, 
      as: "application/json", 
      basic_auth: [@api_key, @password]
    }
  end

  ## DIRTY DIRTY DIRTY - don't deploy that nasty TODO FIXME
  def dev_settings
    @api_key = DummyStore.api_key
    @shop_domain = DummyStore.store
    @password = DummyStore.password
  end

end
