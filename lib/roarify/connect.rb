module Roarify
  class Connect
    @@auth_keys = {}

    def initialize(keys) #api_key=nil, password=nil, shop_domain=nil)
      @api_key = keys[:api_key]
      @password = keys[:password]
      @shop_domain = keys[:shop_domain]
      set_connection
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

    def self.auth
      Connect.new(@@auth_keys)
    end

    def set_keys( opts={} )
      opts[:api_key]      || 'Not set.'
      opts[:password]     || 'Not set.'
      opts[:shop_domain]  || 'Not set.'
      @@auth_keys = opts
    end

    def set_connection
      set_keys(api_key: @api_key, password: @password, shop_domain: @shop_domain)
    end

  end
end
