module Yaps
  # Handles creation of Activities upon destruction and update of tracked model.
  module Updation
    extend ActiveSupport::Concern
    include Wisper::Publisher

    included do
      after_update { publish(:"#{ActiveSupport::Inflector.underscore(self.class.name)}_updated", self) }
    end
  end
end
