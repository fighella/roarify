class SmartCollection
  attr_accessor :body_html, :handle, :id, :image, :published_at, :rules, :published_scope, :relation, :sort_order, :title

# body_html
# { "body_html" : "<p>The best selling ipod ever</p>" }
# The description of the smart collection, complete with HTML markup. Many templates display this on their smart collection pag
# 
# handle
# { "handle" : "smart_ipods" }
# A human-friendly unique string for the smart collection automatically generated from its title. This is used in shop themes by the Liquid templating language to refer to the smart collection. Limit of 255 characters.
# 
# id
# { "id" : "482865238" }
# The unique numeric identifier for the smart collection.
# 
# image
# { "image" : "{ }" }
# The collection image.
# 
# published_at
# { "published_at" : "2008-02-01T19:00:00-05:00" }
# This can have two different types of values, depending on whether the smart collection has been published (i.e., made visible to customers):
# 
# If the smart collection is published, this value is the date and time when it was published. The API returns this value in ISO 8601 format.
# If the smart collection is hidden (i.e., not published), this value is null. Changing a smart collection's status from published to hidden changes its published_at property to null.
# published_scope
# { "published_scope" : "global" }
# The sales channels in which the smart collection is visible.
# 
# rules
# { "column" : "variant_price" }
# { "relation" : "less_than" }
# { "condition" : "20" }
# The list of rules that define what products go into the smart collection. Each rule has the following properties:
# 
# relation:
# The relation between the identifier for the condition and the numeric amount.
# condition:
# Select products for a collection using a condition.
# column:
# title: Product title.
# type: Product type.
# vendor: Product vendor.
# variant_price: Product price.
# tag: Product tag.
# variant_compare_at_price: Compare at price.
# variant_weight: Weight.
# variant_inventory: Inventory stock.
# variant_title: Variant's title.
# disjunctive
# { "disjunctive" : "false" }
# If false, products must match all of the rules to be included in the collection. If true, products can only match one of the rules.
# 
# sort_order
# { "sort_order" : "alpha-asc" }
# The order in which products in the smart collection appear. Valid values are:
# 
# alpha-asc: Alphabetically, in ascending order (A - Z).
# alpha-desc: Alphabetically, in descending order (Z - A).
# best-selling: By best-selling product.
# created: By date created, in ascending order (oldest - newest).
# created-desc: By date created, in descending order (newest - oldest).
# manual: Ordered by the shop owner.
# price-asc: By price, in ascending order (lowest - highest).
# price-desc: By price, in descending order (highest - lowest).
# template_suffix
# { "template_suffix" : "null" }
# The suffix of the template you are using. By default, the original template is called product.liquid, without any suffix. Any additional templates will be: product.suffix.liquid.
# 
# title
# { "title" : "Smart iPods" }
# The name of the smart collection. Limit of 255 characters.
# 
# updated_at
# { "updated_at" : "2008-02-01T19:00:00-05:00" }
# The date and time when the smart collection was last modified. The API returns this value in ISO 8601 format.
# 
end
