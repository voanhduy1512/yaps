module Yaps
  # Handles creation of Activities upon destruction and update of tracked model.
  module Destruction
    extend ActiveSupport::Concern
    include Wisper::Publisher

    included do
      before_destroy { publish(:"#{ActiveSupport::Inflector.underscore(self.class.name)}_deleted", self) }
    end
  end
end
