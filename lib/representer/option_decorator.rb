class OptionDecorator < Roar::Decorator
  include Roar::Client
  include Roar::JSON
  include OptionRepresenter
  self.representation_wrap = :option
end
