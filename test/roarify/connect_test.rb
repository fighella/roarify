require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'roarify/connect'

class Roarify::ConnectTest < MiniTest::Spec
    
    # connect to the shop
    # get the shop details
    it "can connect to the shop" do
      shop = Roarify::Connect.new
      shop.password = 'somepassword'


      puts shop.password
      

      #should not fuckup
      
    end

end

