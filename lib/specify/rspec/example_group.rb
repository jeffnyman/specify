module RSpec
  module Specify
    module ExampleGroup
      # rubocop:disable Naming/MethodName
      def Given(message, options = {}, &block)
        run_example_step(:given, message, options, &block)
      end
      # rubocop:enable Naming/MethodName

      private

      def run_example_step(type, msg, opts = {}, &_block)
        ::RSpec.world.reporter.example_step_started(self, type, msg, opts)

        if block_given?
          begin
            yield
          # rubocop:disable Lint/RescueException
          rescue Exception => e
            ::RSpec.world.reporter.example_step_failed(self, type, msg, opts)
            raise e
          end
          # rubocop:enable Lint/RescueException
          ::RSpec.world.reporter.example_step_passed(self, type, msg, opts)
        end
      end
    end
  end
end
