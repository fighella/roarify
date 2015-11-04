require "roarify/version"
require "roar"
require "roar/decorator"
require "roar/json"

module Roarify
  require "ostruct"
  require "pp"
  require "representable/debug"
  require "roarify/representer"
  require "representer/asset_representer"
  require "representer/asset_decorator"
  require "representer/product_representer"
  require "representer/product_decorator"
  require "representer/variant_decorator"
  require "representer/search_representer"
  require "representer/image_representer"
  require "representer/image_decorator"
  require "representer/option_representer"
  require "representer/option_decorator"
  require "representer/order_decorator"
  require "representer/order_representer"
  require "representer/line_item_representer"
  require "representer/line_item_decorator"
  require "representer/shop_representer"
  require "representer/shop_decorator"
  require "representer/smart_collection_representer"
  require "representer/smart_collection_decorator"
  require "representer/theme_representer"
  require "representer/theme_decorator"
  require "representer/collection_rule_representer"
  require "representer/collection_rule_decorator"
  require "roarify/connect"
  require "roarify/address"
  require "roarify/asset"
  require "roarify/client_detail"
  require "roarify/collection_rule"
  require "roarify/payment_detail"
  require "roarify/property"
  require "roarify/receipt"
  require "roarify/refund"
  require "roarify/refund_line_item"
  require "roarify/shipping_line"
  require "roarify/tax_line"
  require "roarify/product"
  require "roarify/order"
  require "roarify/discount_code"
  require "roarify/fulfillment"
  require "roarify/line_item"
  require "roarify/transaction"
  require "roarify/note_attribute"
  require "roarify/order"
  require "roarify/product_update"
  require "roarify/product_create"
  require "roarify/smart_collection"
  require "roarify/option"
  require "roarify/search"
  require "roarify/shop"
  require "roarify/image"
  require "roarify/finder"
  require "roarify/theme"
  require "roarify/url"
  require "roarify/variant"
  require "roarify/redirect"
  require "roarify/error"
  require "representer/redirect_decorator"
  # require "representer/redirect_representer"
end
