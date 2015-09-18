require 'yaml'
module Roarify
  class Redirect
    attr_accessor :path, :target, :id

    def save
      if update
        puts 'Updated!'
      else
        puts 'NOT UPDATED!'
      end
    end

    def update
      begin
        representer.post(representer.resource_request)
      rescue
        ## Figure out some error handling n shit
        puts 'Probably a duplicate!'
      end
    end

    def representer
      RedirectDecorator.new(self)
    end

    # def escaped_path
    #    YAML.load(%Q(---\n"#{path}"\n))
    # end

    # def escaped_target
    #   YAML.load(%Q(---\n"#{target}"\n))
    # end
    


  end
end
