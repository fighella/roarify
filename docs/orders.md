    #     billing_address
    # { "address1" : "123 Amoebobacterieae St" }
    # { "address2" : "" }
    # { "city" : "Ottawa" }
    # { "company" : "null" }
    # { "country" : "US" }
    # { "first_name" : "null" }
    # { "id" : 207119551 }
    # { "last_name" : "null" }
    # { "phone" : "(555)555-5555" }
    # { "province" : "KY" }
    # { "zip" : "40202" }
    # { "name" : "null" }
    # { "province_code" : "null" }
    # { "country_code" : "null" }
    # { "default" : true }
    # The mailing address associated with the payment method. This address is an optional field that will not be available on orders that do not require one. It has the following properties:
    # 
    # address1: The street address of the billing address.
    # address2: An optional additional field for the street address of the billing address.
    # city: The city of the billing address.
    # company: The company of the person associated with the billing address.
    # country: The name of the country of the billing address.
    # country_code: The two-letter code (ISO 3166-1 alpha-2 two-letter country code) for the country of the billing address.
    # first_name: The first name of the person associated with the payment method.
    # last_name: The last name of the person associated with the payment method.
    # latitude: The latitude of the billing address.
    # longitude: The longitude of the billing address.
    # name: The full name of the person associated with the payment method.
    # phone: The phone number at the billing address.
    # province: The name of the state or province of the billing address.
    # province_code: The two-letter abbreviation of the state or province of the billing address.
    # zip:The zip or postal code of the billing address.
    # browser_ip
    # { "browser_ip" : "null" }
    # The IP address of the browser used by the customer when placing the order.
    # 
    # buyer_accepts_marketing
    # { "buyer_accepts_marketing" : false }
    # Indicates whether or not the person who placed the order would like to receive email updates from the shop. This is set when checking the "I want to receive occasional emails about new products, promotions and other news" checkbox during checkout. Valid values are "true" and "false."
    # 
    # cancel_reason
    # { "cancel_reason" : "null" }
    # The reason why the order was cancelled. If the order was not cancelled, this value is "null." If the order was cancelled, the value will be one of the following:
    # 
    # customer: The customer changed or cancelled the order.
    # fraud: The order was fraudulent.
    # inventory: Items in the order were not in inventory.
    # other: The order was cancelled for a reason not in the list above.
    # cancelled_at
    # { "cancelled_at" : "null" }
    # The date and time when the order was cancelled. If the order was cancelled, the API returns this value in ISO 8601 format. If the order was not cancelled, this value is "null."
    # 
    # cart_token
    # { "cart_token" : "68778783ad298f1c80c3bafcddeea" }
    # Unique identifier for a particular cart that is attached to a particular order.
    # 
    # client_details
    # { "accept_language" : "null" }
    # { "browser_height" : "null" }
    # { "browser_ip" : "0.0.0.0" }
    # { "browser_width" : "null" }
    # { "session_hash" : "null" }
    # { "user_agent" : "null" }
    # An object containing information about the client:
    # 
    # accept_language:
    # browser_height: The browser screen height in pixels, if available.
    # browser_ip: The browser IP address.
    # browser_width: The browser screen width in pixels, if available.
    # session_hash: A hash of the session.
    # user_agent
    # closed_at
    # { "closed_at" : "null" }
    # The date and time when the order was closed. If the order was closed, the API returns this value in ISO 8601 format. If the order was not closed, this value is null.
    # 
    # created_at
    # { "created_at" : "2008-01-10T11:00:00-05:00" }
    # The date and time when the order was created in Shopify, in ISO 8601 format. This property is auto-generated and read-only. If you are importing orders to the Shopify platform from another system, use the writable processed_at property to indicate when the order was processed.
    # 
    # currency
    # { "currency" : "USD" }
    # The three letter code (ISO 4217) for the currency used for the payment.
    # 
    # customer
    # { "accepts_marketing" : false }
    # { "created_at" : "2012-03-13T16:09:55-04:00" }
    # { "email" : "bob.norman@hostmail.com" }
    # { "first_name" : "Bob" }
    # { "id" : 207119551 }
    # { "last_name" : "Norman" }
    # { "note" : "null" }
    # { "last_name" : "null" }
    # { "orders_count" : "0" }
    # { "state" : "null" }
    # { "total_spent" : "0.00" }
    # { "updated_at" : "2012-03-13T16:09:55-04:00" }
    # { "tags" : "tagcity" }
    # An object containing information about the customer. It is important to note that the order may not have a customer and consumers should not depend on the existence of a customer object. This value may be null if the order was created through Shopify POS
    # 
    # Customer objects may contain the following fields:
    # accepts_marketing: Indicates whether or not the customer would like to receive email updates from the shop. Valid values are true and false.
    # created_at: The date and time when the customer record was created.
    # email: The customer's email address.
    # first_name: The customer's first name.
    # order_id: A unique numeric identifier for the customer.
    # last_name: The customer's last name.
    # note: Extra information about the customer
    # orders_count: The number of orders placed by this customer to a shop. Pulls the current information
    # state:
    # total_spent:
    # updated_at: The date and time when the customer record was last updated.
    # tags: Tags are additional short descriptors, commonly used for filtering and searching, formatted as a string of comma-separated values. For example, if an order has three tags: tag1, tag2, tag3.
    # discount_codes
    # { "discount_codes" : "[]" }
    # Applicable discount codes that can be applied to the order. If no codes exist the value will default to blank.
    # 
    # A Discount code will include the following fields:
    # amount: The amount of the discount.
    # code: The discount code.
    # type: The type of discount. Can be one of: "percentage", "shipping", "fixed_amount" (default).
    # email
    # { "email" : "bob.norman@hostmail.com" }
    # The customer's email address. Is required when a billing address is present.
    # 
    # financial_status
    # { "financial_status" : "authorized" }
    # pending: The finances are pending.
    # authorized: The finances have been authorized.
    # partially_paid: The finances have been partially paid.
    # paid: The finances have been paid. (This is the default value.)
    # partially_refunded: The finances have been partially refunded.
    # refunded: The finances have been refunded.
    # voided: The finances have been voided.
    # fulfillments
    # { "created_at" : "2012-03-13T16:09:54-04:00" }
    # { "id" : 255858046 }
    # { "order_id" : 450789469 }
    # { "status" : "failure" }
    # { "tracking_company" : "null" }
    # { "tracking_number" : "1Z2345" }
    # { "updated_at" : "2012-05-01T14:22:25-04:00" }
    # created_at: The date and time when the fulfillment was created. The API returns this value in ISO 8601 format.
    # id: The unique numeric identifier for the fulfillment.
    # line_items: A historical record of each item in the fulfillment.
    # order_id: The unique numeric identifier for the order.
    # receipt: A textfield with information about the receipt.
    # status: The status of the fulfillment.
    # tracking_company: The name of the shipping company.
    # tracking_number: The shipping number, provided by the shipping company.
    # updated_at: The date and time when the fulfillment was last modified. The API returns this value in ISO 8601 format.
    # fulfillment_status
    # { "fulfillment_status" : "null" }
    # fulfilled: Every line item in the order has been fulfilled.
    # null: None of the line items in the order have been fulfilled.
    # partial: At least one line item in the order has been fulfilled.
    # tags
    # { "tags" : "tagsational" }
    # Tags are additional short descriptors, commonly used for filtering and searching, formatted as a string of comma-separated values. For example, if an order has three tags: tag1, tag2, tag3. Each individual tag is limited to 40 characters in length.
    # 
    # gateway
    # { "gateway" : "authorize_net" }
    # Deprecated as of July 14, 2014. This information is instead available on transactions The payment gateway used.
    # 
    # id
    # { "id" : 450789469 }
    # The unique numeric identifier for the order. This one is used for API purposes. This is different from the order_number property (see below), which is also a unique numeric identifier for the order, but used by the shop owner and customer.
    # 
    # landing_site
    # { "landing_site" : "http://www.example.com?source=abc" }
    # The URL for the page where the buyer landed when entering the shop.
    # 
    # line_items
    # { "fulfillable_quantity" : 1 }
    # { "fulfillment_service" : "amazon" }
    # { "fulfillment_status" : "fulfilled" }
    # { "grams" : 500 }
    # { "id" : 669751112 }
    # { "price" : "199.99" }
    # { "product_id" : 7513594 }
    # { "quantity" : 1 }
    # { "requires_shipping" : true }
    # { "sku" : "IPOD-342-N" }
    # { "title" : "IPod Nano" }
    # { "variant_id" : 4264112 }
    # { "variant_title" : "Pink" }
    # { "vendor" : "Apple" }
    # { "name" : "IPod Nano - Pink" }
    # { "gift_card" : false }
    # { "taxable" : true }
    # { "tax_lines" : "[]" }
    # { "total_discount" : "5.00" }
    # A list of line item objects, each one containing information about an item in the order. Each line_item object has the following properties:
    # 
    # fulfillable_quantity: The amount available to fulfill. This is the quantity - max(refunded_quantity, fulfilled_quantity) - pending_fulfilled_quantity.
    # fulfillment_service: Service provider who is doing the fulfillment. Valid values are either "manual" or the name of the provider. eg: "amazon", "shipwire", etc.
    # fulfillment_status: How far along an order is in terms line items fulfilled. Valid values are: fulfilled, null or partial.
    # grams: The weight of the item in grams.
    # id: The id of the line item.
    # price: The price of the item before discounts have been applied.
    # product_id: The unique numeric identifier for the product in the fulfillment. Can be null if the original product associated with the order is deleted at a later date
    # quantity: The number of products that were purchased.
    # requires_shipping: States whether or not the fulfillment requires shipping. Values are: true or false.
    # sku: A unique identifier of the item in the fulfillment.
    # title: The title of the product.
    # variant_id: The id of the product variant.
    # variant_title: The title of the product variant.
    # vendor: The name of the supplier of the item.
    # name: The name of the product variant.
    # gift_card: States whether or not the line_item is a gift card. If so, the item is not taxed or considered for shipping charges.
    # taxable: States whether or not the product was taxable. Values are: true or false.
    # tax_lines: A list of tax_line objects, each of which details the taxes applicable to this line_item.
    # total_discount: The total discount amount applied to this line item. This value is not subtracted in the line item price.
    # name
    # { "name" : "#1001" }
    # The customer's order name as represented by a number.
    # 
    # note
    # { "note" : "null" }
    # The text of an optional note that a shop owner can attach to the order.
    # 
    # note_attributes
    # { "note_attributes" : [{ "name" : "custom name" }, { "value" : "custom value" }] }
    # Extra information that is added to the order. Each array entry must contain a hash with "name" and "value" keys as shown above.
    # 
    # number
    # { "number" : "1" }
    # Numerical identifier unique to the shop. A number is sequential and starts at 1000.
    # 
    # order_number
    # { "order_number" : 1001 }
    # A unique numeric identifier for the order. This one is used by the shop owner and customer. This is different from the id property, which is also a unique numeric identifier for the order, but used for API purposes.
    # 
    # payment_details
    # { "avs_result_code" : "null" }
    # { "credit_card_bin" : "null" }
    # { "cvv_result_code" : "null" }
    # { "credit_card_number" : "•••• •••• •••• 4242" }
    # { "credit_card_company" : "Visa" }
    # Deprecated as of July 7, 2014. This information is instead available on transactions An object containing information about the payment. It has the following properties:
    # 
    # avs_result_code: The Response code from AVS the address verification system. The code is a single letter; see this chart for the codes and their definitions.
    # credit_card_bin: The issuer identification number (IIN), formerly known as bank identification number (BIN) ] of the customer's credit card. This is made up of the first few digits of the credit card number.
    # credit_card_company: The name of the company who issued the customer's credit card.
    # credit_card_number: The customer's credit card number, with most of the leading digits redacted with Xs.
    # cvv_result_code: The Response code from the credit card company indicating whether the customer entered the card security code, a.k.a. card verification value, correctly. The code is a single letter or empty string; see this chart for the codes and their definitions.
    # payment_gateway_names
    # { "payment_gateway_names" : ["authorize_net", "Cash on Delivery (COD)"] }
    # The list of all payment gateways used for the order.
    # 
    # processed_at
    # { "processed_at" : "2008-01-10T11:00:00-05:00" }
    # The date and time when the order was imported, in ISO 8601 format. This value can be set to dates in the past when importing from other systems. If no value is provided, it will be auto-generated.
    # 
    # processing_method
    # { "processing_method" : "direct" }
    # States the type of payment processing method. Valid values are: checkout, direct, manual, offsite or express.
    # 
    # referring_site
    # { "referring_site" : "http://www.anexample.com" }
    # The website that the customer clicked on to come to the shop.
    # 
    # refunds
    # The list of refunds applied to the order.
    # 
    # shipping_address
    # { "address1" : "123 Amoebobacterieae St" }
    # { "address2" : "" }
    # { "city" : "Ottawa" }
    # { "company" : "null" }
    # { "country" : "Canada" }
    # { "first_name" : "Bob" }
    # { "last_name" : "Bobsen" }
    # { "latitude" : "45.41634" }
    # { "longitude" : "-75.6868" }
    # { "phone" : "555-625-1199" }
    # { "province" : "Ontario" }
    # { "zip" : "K2P0V6" }
    # { "name" : "Bob Bobsen" }
    # { "country_code" : "CA" }
    # { "province_code" : "ON" }
    # The mailing address to where the order will be shipped. This address is optional and will not be available on orders that do not require one. It has the following properties:
    # 
    # address1: The street address of the shipping address.
    # address2: An optional additional field for the street address of the shipping address.
    # city: The city of the shipping address.
    # company: The company of the person associated with the shipping address.
    # country: The name of the country of the shipping address.
    # country_code: The two-letter code for the country of the shipping address.
    # first_name: The first name of the person associated with the payment method.
    # last_name: The last name of the person associated with the payment method.
    # latitude: The latitude of the shipping address.
    # longitude: The longitude of the shipping address.
    # name: The full name of the person associated with the payment method.
    # phone: The phone number at the shipping address.
    # province: The name of the state or province of the shipping address.
    # province_code: The two-letter abbreviation of the state or province of the shipping address.
    # zip: The zip or postal code of the shipping address.
    # shipping_lines
    # { "code" : "Free Shipping" }
    # { "price" : 0.0 }
    # { "source" : "shopify" }
    # { "title" : "Free Shipping" }
    # { "tax_lines" : "[]" }
    # An array of shipping_line objects, each of which details the shipping methods used. Each shipping_line has the following properties:
    # 
    # code: A reference to the shipping method.
    # price: The price of this shipping method.
    # source: The source of the shipping method.
    # title: The title of the shipping method.
    # tax_lines: A list of tax_line objects, each of which details the taxes applicable to this shipping_line.
    # source_name
    # { "source_name" : "web" }
    # Where the order originated. May only be set during creation, and is not writeable thereafter. Orders created through official Shopify channels have protected values that cannot be assigned by other API clients during order creation. These protected values are: "web", "pos", "iphone", and "android" Orders created via the API may be assigned any other string of your choice. If source_name is unspecified, new orders are assigned the value "api".
    # 
    # subtotal_price
    # { "subtotal_price" : 398.0 }
    # Price of the order before shipping and taxes
    # 
    # tax_lines
    # { "price" : 11.94 }
    # { "rate" : 0.06 }
    # { "title" : "State Tax" }
    # An array of tax_line objects, each of which details the total taxes applicable to the order. Each tax_line has the following properties:
    # 
    # price: The amount of tax to be charged.
    # rate: The rate of tax to be applied.
    # title: The name of the tax.
    # taxes_included
    # { "taxes_included" : false }
    # States whether or not taxes are included in the order subtotal. Valid values are "true" or "false".
    # 
    # token
    # { "token" : "b1946ac92492d2347c6235b4d2611184" }
    # Unique identifier for a particular order.
    # 
    # total_discounts
    # { "total_discounts" : "0.00" }
    # The total amount of the discounts to be applied to the price of the order.
    # 
    # total_line_items_price
    # { "total_line_items_price" : "398.00" }
    # The sum of all the prices of all the items in the order.
    # 
    # total_price
    # { "total_price" : "409.94" }
    # The sum of all the prices of all the items in the order, taxes and discounts included (must be positive).
    # 
    # total_tax
    # { "total_tax" : "11.94" }
    # The sum of all the taxes applied to the order (must be positive).
    # 
    # total_weight
    # { "total_weight" : 300 }
    # The sum of all the weights of the line items in the order, in grams.
    # 
    # updated_at
    # { "updated_at" : "2012-08-24T14:02:15-04:00" }
    # The date and time when the order was last modified. The API returns this value in ISO 8601 format.


