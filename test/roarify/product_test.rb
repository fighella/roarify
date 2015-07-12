require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

class Roarify::ProductTest < MiniTest::Spec
  
  describe "Products" do
    it "can create a product" do
      product = Roarify::Product.new
      product.title = 'Trailblazer. The Booksie.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.product_type = 'Video'
      VCR.use_cassette "create_product_#{product.title}-#{product.vendor}" do
        product.save
      end
      product.title.must_equal 'Trailblazer. The Booksie.'
    end

    it "can delete a product zzz" do
      product = Roarify::Product.new
      product.title = 'Gonna Delete this'
      VCR.use_cassette "create_product_with_handle_#{product.handle}" do
        product.save
      end

      VCR.use_cassette "delete_product_by_id_#{product.id}" do
        product.delete
      end
    
      ## Cant Delte in my tests
      #product.must_be_nil
    end

    it "does not update a product when trying to use a handle already taken" do
      product = Roarify::Product.new
      product.title = 'I was like. The movie.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.handle = 'like-the-movie'
      product.product_type = 'Video'
      VCR.use_cassette "create_product_with_taken_handle_#{product.handle}" do
        err = ->{ product.save }.must_raise RuntimeError
        assert_match /Set field will/, err.message
      end
    end

    it "find and update a product" do
      product = Roarify::Product.new
      product.title = 'I was like. The movie.'
      product.body_html = DummyData.new.description
      product.vendor = 'Sutterer Inc'
      product.product_type = 'Video'
      VCR.use_cassette "create_product_with_other_handle_#{product.title}" do
        product.save
      end
      new_product = nil
      VCR.use_cassette "find_new_product_by_handle_#{product.title}" do
        new_product = Roarify::Product.where('handle', product.handle).first
      end
      new_product.title = 'This is a new titles'
      VCR.use_cassette "update_new_product_by_handle_#{product.handle}" do
        new_product.save
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
        product.save
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
      VCR.use_cassette 'add_product_image' do
        product.save
      end
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

    it "wont save product variants on update xxx" do
      product = nil
      VCR.use_cassette "find_product_1418685443" do
        product = Roarify::Product.find(1418685443)
      end
      product_variants_count = product.variants.count
      product.body_html = 'New Description'
      
      option_1 = Roarify::Option.new
      option_2 = Roarify::Option.new
      option_1.name = 'Size'
      option_2.name = 'Colour'
      product.options << option_1
      product.options << option_2
      VCR.use_cassette 'save_product_with_options' do
        product.save
      end
      variant = Roarify::Variant.new
      variant.option1 = "Largest YIM YOM #{Time.now}"
      variant.option2 = 'Bluest 3'
      variant.price = 13.50
      variant.inventory_quantity = 22
      variant.barcode = 'iwaslike'
      variant.title = 'Best Edition 4'
      product.variants << variant
      
      
      variant = Roarify::Variant.new
      variant.option1 = "Largest PLOONK PLANK #{Time.now}"
      variant.option2 = 'Bluest'
      variant.price = 13.50
      variant.inventory_quantity = 22
      variant.barcode = 'iwaslike'
      variant.title = 'Best Edition 2'
      product.variants << variant
      puts product.variants.inspect
      puts 'SAVE!'
      VCR.use_cassette 'save_product_with_new_variant' do
        product.save
      end
      puts 'SAVED!'
      puts product.variants.inspect

      product.body_html.must_equal 'New Description'
      product.variants.count.must_equal product_variants_count + 1
      sv = product.variants.count

      variant = Roarify::Variant.new
      variant.option1 = "Largest Boogie #{Time.now}"
      variant.option2 = 'Bluest 22'
      variant.price = 13.50
      variant.inventory_quantity = 22
      variant.barcode = 'iwaslike3'
      variant.title = 'Best Edition 2b'
      product.variants << variant
      
      VCR.use_cassette 'add_another_variant_2' do
        product.save
      end

      ## Re-Get the product for Sanity
      VCR.use_cassette "find_product_1418685443_again" do
        product = Roarify::Product.find(1418685443)
      end
      product.variants.count.must_equal sv + 1
      ## Not sure here...
      ## product.variants.any? { |v| v.title == 'Best Edition 2' }.must_equal true
    end

    it "can find product variants by id" do
      product = Roarify::Product.new
      representer = Roarify::ProductDecorator.new(product)
      product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
      VCR.use_cassette 'show_product_1' do
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
      VCR.use_cassette 'show_product_2' do
        representer.get(uri: product_url,
                        as: "application/json",
                        basic_auth: [DummyStore.api_key, DummyStore.password])
      end
      product.id.must_equal 1418685443
    end

    it "can find a product by hand and update one of its variant" do
      search = Roarify::Search.new
      srepresenter = Roarify::SearchRepresenter.new(search)
      VCR.use_cassette 'find_product_18' do
        srepresenter.find_by(:handle, 'trailblazer-the-book-18')
      end

      ## Do the search, but then 're-find' the book... ??
      product = nil
      VCR.use_cassette 'find_product_3' do
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
