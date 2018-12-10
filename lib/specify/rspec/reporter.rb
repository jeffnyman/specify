module RSpec
  module Specify
    module Reporter
      def example_step_started(example, type, message)
        notify :example_step_started, Notification.new(example, type, message)
      end
    end
  end
end
