module RSpec
  module Specify
    module Reporter
      def example_step_started(example, type, message, options)
        notify :example_step_started,
          Notification.new(example, type, message, options)
      end

      def example_step_passed(example, type, message, options)
        notify :example_step_passed,
          Notification.new(example, type, message, options)
      end

      def example_step_failed(example, type, message, options)
        notify :example_step_failed,
          Notification.new(example, type, message, options)
      end
    end
  end
end
