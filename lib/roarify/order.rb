module Roarify
  class Order
    attr_accessor :id, :email, :total_price

    ## See order docs for spec

    def self.all
      search = Roarify::Search.new(Order).all
      find_by_ids( search.orders.map { |t| t.id } )
    end

    def self.find_by_ids(ids)
      ids.each.map { |id| Order.find(id) }
    end

    def self.find(id)
      Finder.new(Order,id).find
    end

    def self.decorator
      OrderDecorator
    end

  end
end
