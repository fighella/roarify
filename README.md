# ROARify

Access to the Shopify API (https://docs.shopify.com/api) using ROAR (https://github.com/apotonick/roar)

[![Build Status](https://travis-ci.org/fighella/roarify.svg?branch=master)](https://travis-ci.org/fighella/roarify)

## Why?

Because Ghandi kills a kitten everytime someone uses ActiveResource. And we're running out of kittens.

## Shopify API Updates

https://ecommerce.shopify.com/c/api-announcements

## Shopify Objects

ApplicationCharge
Article
Asset
Blog
CarrierService
Checkout
Collect
Comment
Country
CustomCollection
Customer
CustomerAddress
CustomerSavedSearch
Event
Fulfillment
FulfillmentService
Location
Metafield
Order
Order Risks
Page
Policy
Product
Product Image
Product Variant
Province
RecurringApplicationCharge
Redirect
Refund
Shop
SmartCollection
Theme
Transaction
Userplus
Webhook

## Installation

Add this line to your application's Gemfile:

    gem 'roarify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roarify

## Usage

I wouldn't use it yet. Because it aint done.

## 'Live' Testing

#### Dummy store for testing for now

*API Key*
267bb31dc494b49d62868e5845133fea

*Password*
670cb9711a17762b01aedd42692b2225

*Shared Secret*
77b5c92c2fbd96575956dc3e1260f51d

*URL Format*
https://apikey:password@hostname/admin/resource.json

*Example URL*
https://<api_key>:<password>@roarify.myshopify.com/admin/orders.json

## Contributing

1. Fork it ( http://github.com/<my-github-username>/roarify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Special Thanks

Nick Sutterer, Zubin Henner, Sean Seefried
