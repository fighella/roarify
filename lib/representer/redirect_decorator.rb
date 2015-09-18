require 'roar/client'
require 'roarify/redirect'
require 'roarify/representer'

module Roarify
  class RedirectDecorator < Roar::Decorator
    include Roar::Client
    include Roar::JSON
    include Roarify::Representer
    self.api_name = 'redirects'
    self.representation_wrap = :redirect
    
    # property :escaped_path, as: :path
    # property :escaped_target, as: :target
    property :path
    property :target
    property :id

    # def escaped_path
    #    YAML.load(%Q(---\n"#{path}"\n))
    # end

    # def escaped_target
    #   YAML.load(%Q(---\n"#{target}"\n))
    # end
    # 


  end
end
