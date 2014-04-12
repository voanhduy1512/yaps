module Yaps
  # Handles creation of Activities upon destruction and update of tracked model.
  module Updation
    extend ActiveSupport::Concern

    included do
      after_update do
        publish(:"#{ActiveSupport::Inflector.underscore(self.class.name)}_updated", self)
      end
    end
  end
end
