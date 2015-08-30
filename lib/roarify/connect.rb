module Roarify
  class Connect
    attr_accessor :auth

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

    def self.auth
      ## Perhaps some kind of initializer?
      Connect.new(auth_keys)
    end

    def self.set_keys( opts={} )
      opts[:api_key]      || 'Not set.'
      opts[:password]     || 'Not set.'
      opts[:shop_domain]  || 'Not set.'
      @@auth_keys = opts
    end

    def auth_keys
      @@auth_keys
    end

  end
end
