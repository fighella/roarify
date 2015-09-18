require 'minitest/autorun'
require 'pry-rescue/minitest'
require 'test_helper'

class Roarify::RedirectTest < MiniTest::Spec
  
  def vcr_connect
    VCR.use_cassette 'connect_to_test_shop' do
      DummyStore.test_auth
    end
  end
  
  describe "Redirect" do
    it "can create a redirect" do
      vcr_connect
      redirect = Roarify::Redirect.new
      redirect.path = "/some-urlz"
      redirect.target = "https://www.website.com/"
      
      VCR.use_cassette "create_redirect" do
        redirect.save
      end

      redirect.path.must_equal "/some-urlz"
      redirect.target.must_equal "https://www.website.com/"
    end
  end
end
