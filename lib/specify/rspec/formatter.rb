require "rspec/core/formatters/console_codes"
require "rspec/core/formatters/documentation_formatter"

module RSpec
  module Specify
    class Formatter < ::RSpec::Core::Formatters::DocumentationFormatter
      ::RSpec::Core::Formatters.register(
        self,
        :example_started, :example_passed,
        :example_step_passed, :example_step_failed,
        :example_step_pending
      )

      def example_started(notification)
        return unless notification.example.metadata[:has_steps]

        indentation = current_indentation
        description = notification.example.description

        full_message = "#{indentation}#{description}"
        output.puts(
          ::RSpec::Core::Formatters::ConsoleCodes.wrap(full_message, :default)
        )
      end

      def example_passed(notification)
        super unless notification.example.metadata[:has_steps]
      end

      def example_step_passed(notification)
        indentation = current_indentation
        step_type = notification.type.to_s.capitalize
        step_message = notification.message

        full_message = "#{indentation}  #{step_type} #{step_message}"
        output.puts(
          ::RSpec::Core::Formatters::ConsoleCodes.wrap(full_message, :success)
        )
      end

      def example_step_failed(notification)
        indentation = current_indentation
        step_type = notification.type.to_s.capitalize
        step_message = notification.message

        full_message = "#{indentation}  #{step_type} #{step_message} (FAILED)"
        output.puts(
          ::RSpec::Core::Formatters::ConsoleCodes.wrap(full_message, :failure)
        )
      end

      def example_step_pending(notification)
        indentation = current_indentation
        step_type = notification.type.to_s.capitalize
        step_message = notification.message

        full_message = "#{indentation}  #{step_type} #{step_message}"

        full_message << if notification.options[:pending] &&
                           notification.options[:pending] != true
                          " (PENDING: #{notification.options[:pending]})"
                        else
                          " (PENDING)"
                        end

        output.puts(
          ::RSpec::Core::Formatters::ConsoleCodes.wrap(full_message, :pending)
        )
      end
    end
  end
end
