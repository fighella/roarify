require 'roar/client'
require 'representer/theme_decorator'
require 'roarify/theme'
require 'roarify/representer'
module Roarify
  module ThemeRepresenter
    include Roar::JSON
    include Roar::Client
    include Roarify::Representer
    
    # collection :themes, class: Roarify::Theme, decorator: Roarify::ThemeDecorator, wrap: true

    # property :themes
    # property :created_at
    property :id
    # property :name
    # property :role
    # # main: the theme customers see when visiting the shop in a desktop browser.
    # # mobile: the theme customers see when visiting the shop in a mobile browser.
    # # unpublished: the theme that customers cannot currently see.
    # property :updated_at
    # property :previewable
    # property :processing

  end
end

