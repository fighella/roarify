class Search
  attr_accessor :id, :handle, :products

  def find_by_sku(sku)
    variants.find do |v|
      v.sku =~ /sku/ 
    end
  end

  def title
    '123'
  end

  def images
      ##
  end

end

