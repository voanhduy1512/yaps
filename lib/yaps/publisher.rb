module Yaps
  module Publisher
    extend ActiveSupport::Concern
    module ClassMethods
      def published(opts = {})
        options = opts.clone
        include_default_actions(options)
        nil
      end

      def include_default_actions(options)
        defaults = {
          create:  Creation,
          destroy: Destruction,
          update:  Updation
        }

        modules = if options[:except]
          defaults.except(*options[:except])
        elsif options[:only]
          defaults.slice(*options[:only])
        else
          defaults
        end

        modules.each do |key, value|
          include value
        end
      end

      def available_options
        [:only, :except].freeze
      end
    end
  end
end
