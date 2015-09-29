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
        puts order.inspect
      end
      puts 'One order for said test.'
      orders.count.must_be :>=, 1
      orders.count.must_be :<=, 2
    end

    it "can return a single order" do
      vcr_connect
      orders = []
      order = []
      VCR.use_cassette "get_orders" do
        orders = Roarify::Order.all
      end

      order = orders.first
      puts order.class
      order.total_price.must_equal "21.00"
    end
  end
end

