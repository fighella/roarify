module Roarify
  class Order
    attr_accessor :id, :email, :closed_at, :created_at, :updated_at, :total_price, :number, :note, :token, :gateway, :test, :total_weight, :taxes_included, :currency, :financial_status, :confirmed, :cart_token, :buyer_accepts_marketing, :name, :total_line_items_price, :total_price, :subtotal_price, :total_tax, :total_discounts, :referring_site, :landing_site, :cancelled_at, :cancel_reason, :total_price_usd, :checkout_token, :reference, :user_id, :location_id, :source_identifier, :source_url, :processed_at, :device_id, :browser_ip, :landing_site_ref, :order_number, :discount_codes, :note_attributes, :processing_method, :source, :checkout_id, :source_name, :fulfillment_status, :tags, :line_items, :shipping_lines, :billing_address, :shipping_address, :fulfillments, :client_details, :refunds, :transactions, :payment_details, :customer, :tax_lines, :payment_gateway_names

  # line_items []
  # "note_attributes": []
  # "payment_gateway_names": []
  # "tax_lines": [
  # "shipping_lines": []
  # "billing_address": {}
  # "shipping_address": { }
  # "fulfillments": []
  #  "tracking_urls": []
  #  "receipt": {}
  #  "line_items": []
  #  "client_details": {}
  #  "refunds": []
  # "transactions": []
  #    "payment_details": {}
  #     "customer": {

    def self.all
      search = Roarify::Search.new(Order).all
      find_by_ids( search.orders.map { |t| t.id } )
    end

    def self.all_since_id(id)
      search = Roarify::Search.new(Order, "since_id=#{id}").all
      find_by_ids( search.orders.map { |t| t.id } )
    end

    def self.all_since_date(date)
      search = Roarify::Search.new(Order, "?updated_at_min=#{date}").all
      find_by_ids( search.orders.map { |t| t.id } )
    end

    def self.find_by_ids(ids)
      ids.each.map { |id| Order.find(id) }
    end

    def self.find(id)
      Finder.new(Order,id).find
    end

    def self.decorator
      OrderDecorator
    end

  end
end
