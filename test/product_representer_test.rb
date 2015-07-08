require 'minitest/autorun'
# require 'pry-rescue/minitest'
require "test_helper"

class ProductRepresenterTest < MiniTest::Spec
  
  describe "Product Creation" do
    it "can create a product" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product.title = 'Trailblazer. The Book.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.product_type = 'Video'
      VCR.use_cassette 'create_product' do
        representer.create
      end
      ##representer.title.must_equal 'Trailblazer. The Book.'
    end

    it "find and update a product" do
      product = Product.new
      representer = ProductDecorator.new(product)
      
      product.title = 'I was like. The movie.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.handle = 'like-the-movie'
      product.product_type = 'Video'
      VCR.use_cassette 'create_product' do
        representer.create
      end

      VCR.use_cassette 'find_product_by_handle' do
        representer.find_by('handle', product.handle)
      end

      product.title = 'This is a new title'
      VCR.use_cassette 'update product title' do
        representer.update
      end

      ## ERROR
      product.handle.must_equal 'like-the-movie'
    end

    it "can search for a Product by handle" do 
      search = OpenStruct.new
      representer = SearchRepresenter.new(search)
      VCR.use_cassette 'find_product_by_handle' do
        representer.find_by(:handle, 'trailblazer-the-book')
      end
      puts 'HELLO'
      puts search.inspect
      # search.products[0].title.must_match 'Trailblazer the book.'
    end

    it "can add product images" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      image = Image.new
      # irepresenter = ImageDecorator.new(image)
      image.src = DummyData.image
      product.images << image
      representer.update
      ## save?
    end

    # it "searches in product model / but breaks" do 
    #   product = Product.new
    #   representer = ProductDecorator.new(product)
    #   representer.find_by(:handle, 'count-hat')
    #   # product.products[0].title.must_match 'Count Hat'
    # end
    it "can find if a product has any variants" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      product.variants.count.wont_match 0
    end

    it "will send an error message if we add duplicate product variants" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      option_1 = Option.new
      option_2 = Option.new
      # option_1_representer = OptionRepresenter(option_1)
      # option_2_representer = OptionRepresenter(option_2)
      option_1.name = 'Size'
      option_2.name = 'Colour'
      product.options << option_1
      product.options << option_2
      # puts product.inspect
      # puts representer.inspect
      # representer.update

      variant = Variant.new
      # vrepresenter = VariantDecorator.new(variant)
      variant.option1 = 'Large'
      variant.option2 = 'Blue'
      variant.price = 12.50
      variant.inventory_quantity = 12
      variant.barcode = 'iwaslike'
      variant.title = 'BestEdition'
      product.variants << variant

      puts product.variants.inspect
      puts representer.to_json

      VCR.use_cassette 'add_duplicate' do
        representer.update
      end
      ## not right but kind of...
      representer.update.must_equal 'AHH!'
    end

    it "can find product variants by id" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      product.variants[0].sku.must_equal ''
    end

    it "can connect to the shop" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      product.body_html.must_match '<p>'
      product.id.must_equal 1418685443
    end

    it "can find a product by hand and update one of its variant" do
      search = Search.new
      srepresenter = SearchRepresenter.new(search)
      srepresenter.find_by(:handle, 'trailblazer-the-book')

      ## Do the search, but then 're-find' the book... ??
      product = Product.new
      representer = ProductDecorator.new(product)
      VCR.use_cassette 'find_product' do
        representer = representer.find(search.products[0].id)
      end

      matching = product.variants[0]
      matching.sku = 'DISKO-sUz'
      matching.old_inventory_quantity = 1
      matching.inventory_quantity = 12

      # puts "1. Matching: #{matching.inventory_quantity}"
      #is 12

      variant = VariantDecorator.new(matching)
      VCR.use_cassette 'update_product_variant' do
        variant.update
      end
      variant.represented.sku.must_equal 'DISKO-sUz'
    end
  end

end
