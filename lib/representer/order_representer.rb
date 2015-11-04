require 'roar/client'
require 'roarify/representer'

module Roarify
  module OrderRepresenter
    include Roar::JSON
    include Roar::Client
    include Representer

    [:id, :total_price, :email, :closed_at, :created_at, :updated_at, :total_price, :number, :note, :token, :gateway, :test, :total_weight, :taxes_included, :currency, :financial_status, :confirmed, :cart_token, :buyer_accepts_marketing, :name, :total_line_items_price, :total_price, :subtotal_price, :total_tax, :total_discounts, :referring_site, :landing_site, :cancelled_at, :cancel_reason, :total_price_usd, :checkout_token, :reference, :user_id, :location_id, :source_identifier, :source_url, :processed_at, :device_id, :browser_ip, :landing_site_ref, :order_number, :discount_codes, :note_attributes, :processing_method, :source, :checkout_id, :source_name, :fulfillment_status, :tags, :line_items, :shipping_lines, :billing_address, :shipping_address, :fulfillments, :client_details, :refunds, :transactions, :payment_details, :customer, :tax_lines, :payment_gateway_names].map { |p| property p }
    
    
  end
end
