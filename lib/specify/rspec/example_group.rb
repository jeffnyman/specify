module RSpec
  module Specify
    module ExampleGroup
      # rubocop:disable Naming/MethodName
      def Given(message, &block)
        action :given, message, &block
      end
      # rubocop:enable Naming/MethodName

      private

      def action(type, message, &_block)
        ::RSpec.world.reporter.example_step_started(
          self, type, message
        )

        return unless block_given?

        ::RSpec.world.reporter.example_step_passed(
          self, type, message
        )
      end
    end
  end
end
