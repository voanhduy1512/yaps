module Yaps
  module ExtendPublisher
    def publish(*args)
      Yaps.configuration.enable? && super
    end
  end

  module Publisher
    extend ActiveSupport::Concern
    include Wisper::Publisher
    prepend ExtendPublisher

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
