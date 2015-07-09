require 'minitest/autorun'
#require 'pry-rescue/minitest'
require "test_helper"

class SmartCollectionRepresenterTest < MiniTest::Spec
  
  describe "Smart Collections" do
    it "can create a new smart collection" do
      sc = SmartCollection.new
      representer = SmartCollectionDecorator.new(sc)
      sc.title = 'New SC'
      VCR.use_cassette 'create_smart_collections' do
        representer.create
      end
      # product.variants[0].sku.must_equal ''
    end

    it "can create a new smart collection with rules" do
      sc = SmartCollection.new
      representer = SmartCollectionDecorator.new(sc)
      sc.title = 'New SC'
      rule = CollectionRule.new
      rules = []
      rule.column = 'title'
      rule.relation =  'starts_with'
      rule.condition = 'Shoes'
      rules << rule
      sc.rules = rules
      VCR.use_cassette 'create_smart_collections_with_rules' do
        representer.create
      end
      # product.variants[0].sku.must_equal ''
    end
  end

end
