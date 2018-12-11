module RSpec
  module Specify
    module ExampleGroup
      # rubocop:disable Naming/MethodName
      def Given(message, options = {}, &block)
        run_example_step(:given, message, options, &block)
      end

      def When(message, options = {}, &block)
        run_example_step(:when, message, options, &block)
      end

      def Then(message, options = {}, &block)
        run_example_step(:then, message, options, &block)
      end

      def And(message, options = {}, &block)
        run_example_step(:and, message, options, &block)
      end

      def But(message, options = {}, &block)
        run_example_step(:but, message, options, &block)
      end
      # rubocop:enable Naming/MethodName

      private

      def run_example_step(type, msg, opts = {}, &block)
        ::RSpec.world.reporter.example_step_started(self, type, msg, opts)

        opts = { pending: true } if opts == :pending

        if block_given? && !opts[:pending]
          execute_step(type, msg, opts, &block)
        else
          ::RSpec.world.reporter.example_step_pending(
            self, type, msg, opts
          )
        end
      end

      def execute_step(type, msg, opts, &_block)
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
