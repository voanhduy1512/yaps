module Yaps
  # Handles creation of Activities upon destruction and update of tracked model.
  module Creation
    extend ActiveSupport::Concern
    include Wisper::Publisher

    included do
      after_create { publish(:"#{ActiveSupport::Inflector.underscore(self.class.name)}_created", self) }
    end

  end
end
