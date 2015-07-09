require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

class Roarify::ProductTest < MiniTest::Spec
  
  describe "Products" do
    it "can create a product" do
      product = Roarify::Product.new
      product.title = 'Trailblazer. The Book.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.product_type = 'Video'
      VCR.use_cassette "create_product_#{product.title}-#{product.vendor}" do
        Roarify::Product.create(product)
      end
      product.title.must_equal 'Trailblazer. The Book.'
    end

    # it "can delete a product zzz" do
    #   product = Product.new
    #   product.title = 'Gonna Delete this'
    #   VCR.use_cassette "create_product_with_handle_#{product.handle}" do
    #     product = Product.create(product)
    #   end

    #   puts product.id
    #   puts product.class
    #   VCR.use_cassette "delete_product_by_id_#{product.id}" do
    #     product.delete
    #   end
    # 
    #   product.must_be_nil

    # end

    it "find and update a product" do
      product = Roarify::Product.new
      product.title = 'I was like. The movie.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.handle = 'like-the-movie'
      product.product_type = 'Video'
      VCR.use_cassette "create_product_with_handle_#{product.handle}" do
        Roarify::Product.create(product)
      end
      new_product = nil
      VCR.use_cassette "find_new_product_by_handle_#{product.handle}" do
        new_product = Roarify::Product.where('handle', product.handle).first
      end
      new_product.title = 'This is a new titles'
      VCR.use_cassette "update_new_product_by_handle_#{product.handle}" do
        new_product.update
      end


      new_product.handle.must_equal product.handle
      new_product.title.must_equal 'This is a new titles'
    end

    it "can search for a Product by handle" do 
      search = OpenStruct.new
      representer = Roarify::SearchRepresenter.new(search)
      VCR.use_cassette 'find_product_by_handle' do
        representer.find_by(:handle, 'trailblazer-the-book')
      end
      # search.products[0].title.must_match 'Trailblazer the book.'
    end

    it "can find a product or create a new one" do
      product = nil
      VCR.use_cassette 'find_or_init_product' do
        product = Roarify::Product.where_first_or_initialize('handle', 'i-like-this-book')
      end
      product.title = 'New Title'
      VCR.use_cassette 'update_fs_o_i_product' do
        product.update
      end
      product.handle.must_equal 'i-like-this-book'
    end

    it "can add product images" do
      product = nil
      VCR.use_cassette "show_product_1418685443" do
        product = Roarify::Product.find(1418685443)
      end
      image = Roarify::Image.new
      image.src = DummyData.image
      product.images << image
      product.update
    end

    # it "searches in product model / but breaks" do 
    #   product = Product.new
    #   representer = ProductDecorator.new(product)
    #   representer.find_by(:handle, 'count-hat')
    #   # product.products[0].title.must_match 'Count Hat'
    # end

    it "can find if a product has any variants" do
      product = nil
      VCR.use_cassette "show_product_1418685443" do
        product = Roarify::Product.find(1418685443)
      end
      product.variants.count.wont_match 0
    end

    it "will send an error message if we add duplicate product variants" do
      product = nil
      VCR.use_cassette "find_product_1418685443" do
        product = Roarify::Product.find(1418685443)
      end
      option_1 = Roarify::Option.new
      option_2 = Roarify::Option.new
      option_1.name = 'Size'
      option_2.name = 'Colour'
      product.options << option_1
      product.options << option_2

      variant = Roarify::Variant.new
      variant.option1 = 'Large'
      variant.option2 = 'Blue'
      variant.price = 12.50
      variant.inventory_quantity = 12
      variant.barcode = 'iwaslike'
      variant.title = 'BestEdition'
      product.variants << variant

      updated_product = nil
      VCR.use_cassette 'add_duplicate' do
        updated_product = product.update
      end

      ## Updating a product simply won't change variants...
      updated_product.must_equal 'Probably trying to save a duplicate'
    end

    it "can find product variants by id" do
      product = Roarify::Product.new
      representer = Roarify::ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      #product.variants[0].sku.must_equal ''
    end

    it "can connect to the shop" do
      product = Roarify::Product.new
      representer = Roarify::ProductDecorator.new(product)
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
      search = Roarify::Search.new
      srepresenter = Roarify::SearchRepresenter.new(search)
      srepresenter.find_by(:handle, 'trailblazer-the-book')

      ## Do the search, but then 're-find' the book... ??
      product = nil
      VCR.use_cassette 'find_product' do
        product = Roarify::Product.find(search.products[0].id)
      end

      matching = product.variants[0]
      matching.sku = 'DISKO-sUz'
      matching.old_inventory_quantity = 1
      matching.inventory_quantity = 12

      # puts "1. Matching: #{matching.inventory_quantity}"
      #is 12

      variant = Roarify::VariantDecorator.new(matching)
      VCR.use_cassette 'update_product_variant' do
        variant.update
      end
      variant.represented.sku.must_equal 'DISKO-sUz'
    end
  end

end
