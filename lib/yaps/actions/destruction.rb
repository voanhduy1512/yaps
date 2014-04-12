module Yaps
  # Handles creation of Activities upon destruction and update of tracked model.
  module Destruction
    extend ActiveSupport::Concern

    included do
      before_destroy do
        publish(:"#{ActiveSupport::Inflector.underscore(self.class.name)}_deleted", self)
      end
    end
  end
end
