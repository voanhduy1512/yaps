module Yaps
  module Subscriber
    extend ActiveSupport::Concern
    module ClassMethods
      def subscribe(event, opts)
        options = opts.clone
        puts subscribe_instance.object_id
        Wisper.add_listener(subscribe_instance, on: event, with: options[:with])
        nil
      end

      def subscribe_instance
        @subscribe_instance ||= self.new
      end

      def available_options
        [:on, :with].freeze
      end
    end
  end
end
