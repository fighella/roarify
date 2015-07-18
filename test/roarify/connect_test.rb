require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'roarify/connect'

class Roarify::ConnectTest < MiniTest::Spec
    
    it "can connect to the shop" do
      keys = { api_key: DummyStore.api_key, shop_domain: DummyStore.store, password: DummyStore.password }
      Roarify::Connect.new(keys).connection
      shop = nil
      VCR.use_cassette 'finds the connected shop' do
        shop = Roarify::Shop.find
      end
      shop.city.must_equal 'Byron Bay'
    end

end

