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
  require "representer/shop_representer"
  require "representer/shop_decorator"
  require "representer/smart_collection_representer"
  require "representer/smart_collection_decorator"
  require "representer/theme_representer"
  require "representer/theme_decorator"
  require "representer/collection_rule_representer"
  require "representer/collection_rule_decorator"
  require "roarify/connect"
  require "roarify/collection_rule"
  require "roarify/product"
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
end
