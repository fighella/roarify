require "test_helper"

class RepresenterTest < MiniTest::Spec
  class Shop < OpenStruct
    class Representer < Roar::Decorator
      include Roar::JSON

      property :location
    end
  end

  # render
  it do
    shop = Shop.new(location: "Ottawa")
    Shop::Representer.new(shop).to_json.must_equal %{{"location":"Ottawa"}}
  end

  # parsing
  it do
    shop = Shop.new
    Shop::Representer.new(shop).from_json(%{{"location":"Ottawa"}})
    shop.location.must_equal "Ottawa"
  end
end