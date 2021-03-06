require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

class Roarify::OrderTest < MiniTest::Spec
  
  def vcr_connect
    VCR.use_cassette 'connect_to_test_shop' do
      DummyStore.test_auth
    end
  end
  
  describe "Order" do
    it "can get all orders" do
      vcr_connect
      orders = []
      
      VCR.use_cassette "get_orders" do
        orders = Roarify::Order.all
      end

      orders.each do |order|
        # puts order.inspect
      end
      orders.count.must_be :>=, 1
      orders.count.must_be :<=, 2
    end

    it "can get all orders since order 1350600322" do
      vcr_connect
      orders = []
      
      VCR.use_cassette "get_orders since" do
        orders = Roarify::Order.all_since_id('1350600322')
      end

      orders.each do |order|
        # puts order.inspect
      end

     orders.count.must_be :>=, 1

    end

    it "can doesnt return any orders when none" do
      vcr_connect
      orders = []
      
      VCR.use_cassette "get_orders since huge number" do
        orders = Roarify::Order.all_since_id('13506009325824')
      end

      orders.each do |order|
        # puts order.inspect
      end

     orders.count.must_be :==, 0

    end

    it "can return a single order" do
      vcr_connect
      orders = []
      order = []
      VCR.use_cassette "get_orders" do
        orders = Roarify::Order.all
      end
      puts 'Order Test'
      order = orders.first
      # binding.pry
      
      order.total_price.must_equal "21.00"
    end
  end
end

