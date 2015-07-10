require 'minitest/autorun'
#require 'pry-rescue/minitest'
require "test_helper"

class SmartCollectionTest < MiniTest::Spec
  
  describe "Smart Collections" do
    it "can create a new smart collection" do
      sc = Roarify::SmartCollection.new
      sc.title = 'New SC'
      VCR.use_cassette 'create_smart_collections' do
        sc.create
      end
      # product.variants[0].sku.must_equal ''
    end

    it "should fail if you pass bad rule conditions" do
      sc = Roarify::SmartCollection.new
      sc.title = 'Bad Rules!'
      rules = []
      rules << Roarify::CollectionRule.new(where: 'title', contains: 'Trailblazer')
      ### THIS ONES BAD!
      rules << Roarify::CollectionRule.new(where: 'vendor', is_not_equal_to: 'Boogie')
      sc.rules = rules
      VCR.use_cassette 'create_smart_collections_with_bad_rules' do
      err = ->{ sc.create }.must_raise RuntimeError
      assert_match /Invalid/, err.message
      end
      # sc.must_raise RuntimeError #"Invalid Options Passed - Options ARE: [:equals, :not_equals, :greater_than, :less_than, :not_contains, :starts_with, :ends_with, :contains]"
    end

    it "can create a new smart collection with rules" do
      sc = Roarify::SmartCollection.new
      sc.title = 'New SC 2'
      rules = []
      rules << Roarify::CollectionRule.new(where: 'title', contains: 'Trailblazer')
      rules << Roarify::CollectionRule.new(where: 'vendor', not_equals: 'Boogie')
      sc.rules = rules
      VCR.use_cassette 'create_smart_collections_with_rules' do
        sc.create
      end
      # product.variants[0].sku.must_equal ''
    end
  end

end
