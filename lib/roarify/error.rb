module Roarify
  class Error
    def initialize(e)
      @exception = e
      raise_error
    end
  
    def raise_error
      if @exception.class == Roar::Transport::Error
        e = @exception
        raise "Cannot Create/Update Product - Check your data - Taken Handle? [Create/Update] \n #{e.exception} :: #{e.message} #{e.exception.response.body}\n #{self.inspect.to_s}"
        # raise "Cannot Update this Product - Check your data - Taken Handle? [Update] \n #{e.exception} :: #{e.message} #{e.exception.response ? e.response.body : ''}"#".exception.response.body}\n #{self.inspect.to_s}"
      else
        raise "Something broke!#{@exception.inspect}"
      end
      binding.pry
    end

    def self.log(error)
      puts "Roarify Error: " + error
    end
  end
end
