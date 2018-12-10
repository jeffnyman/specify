module RSpec
  module Specify
    module ExampleGroup
      # rubocop:disable Naming/MethodName
      def Given(message)
        action :given, message
      end
      # rubocop:enable Naming/MethodName

      private

      def action(type, message)
        ::RSpec.world.reporter.example_step_started(
          self, type, message
        )
      end
    end
  end
end
