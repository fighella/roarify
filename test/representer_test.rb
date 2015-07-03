require "test_helper"

class RepresenterTest < MiniTest::Spec

  describe "when we want to" do
    it "can create a product" do
      product = Product.new
      representer = ProductDecorator.new(product)
      product.title = 'Trailblazer the book.'
      product.body_html = DummyData.new.description
      product.vendor = 'VayBay'
      product.product_type = 'Bible'
      products_url = "https://#{DummyStore.store}/admin/products.json"
      representer.post(uri: products_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
      product.title.must_match 'Trailblazer the book.'
    end
  end

  it "can search for a Product by handle" do 
    search = Search.new
    representer = SearchRepresenter.new(search)
    representer.find_by(:handle, 'trailblazer-the-book')
    search.products[0].title.must_match 'Trailblazer the book.'
  end

  it "can add product images" do
    product = Product.new
    representer = ProductDecorator.new(product)
    product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
    representer.get(uri: product_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
    product.images << DummyData.image
    product.save
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
    representer.get(uri: product_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
    product.variants.count.wont_match 0
  end

  it "can add product variants" do
    product = Product.new
    representer = ProductDecorator.new(product)
    product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
    representer.get(uri: product_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
    options = ['size','color']
    options.save!
    variant = Variant.new
    variant = VariantDecorator.new(variant)
    variant.option1 = 'Large'
    variant.option1 = 'Small'
    product.variants << variant
  end

  it "can find product variants by id" do
    product = Product.new
    representer = ProductDecorator.new(product)
    product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
    representer.get(uri: product_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
    product.variants[0].sku.must_equal 'LIQ02'
  end

  it "can connect to the shop" do
    product = Product.new
    representer = ProductDecorator.new(product)
    product_url = "https://#{DummyStore.store}/admin/products/1418685443.json"
    representer.get(uri: product_url, as: "application/json",  basic_auth: [DummyStore.api_key, DummyStore.password])
    product.body_html.must_match '<p>'
    product.id.must_equal 1418685443
  end

  it "can find a product by hand and update one of it's variant" do
    search = Search.new
    srepresenter = SearchRepresenter.new(search)
    srepresenter.find_by(:handle, 'trailblazer-the-book')
    
    ## Do the search, but then 're-find' the book... ??
    product = Product.new
    representer = ProductDecorator.new(product)
    representer =  representer.find(search.products[0].id)
    
    matching = product.variants[0]
    matching.sku = 'DISKO-U'

    variant = VariantDecorator.new(matching)
    variant.update
    variant.represented.sku.must_equal 'DISKO-U'
  end

end
