module Roarify
  class Connect
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

    # def self.auth
    #   ## Perhaps some kind of initializer?
    #   keys = { api_key: Roarify.shop_key[:api_key], shop_domain: Roarify.shop_key[:shop_domain], password: Roarify.shop_key[:password] }
    #   Connect.new(keys)
    # end

    # def self.keys( opts={} )
    #   opts[:api_key]      || 'Not set.'
    #   opts[:password]     || 'Not set.'
    #   opts[:shop_domain]  || 'Not set.'
    #   opts
    # end

  end
end
