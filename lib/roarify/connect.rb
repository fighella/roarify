module Roarify
  class Connect
    #attr_accessor :shop_name, :api_key, :password, :shared_secret, :app_type

    def initialize(keys) #api_key=nil, password=nil, shop_domain=nil)
      @api_key = keys[:api_key]
      @password = keys[:password]
      @shop_domain = keys[:shop_domain]
    end

    def connection
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

    def self.test_auth
      keys = { api_key: DummyStore.api_key, shop_domain: DummyStore.store, password: DummyStore.password }
      Connect.new(keys)
    end
  end
end
