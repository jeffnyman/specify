require "rspec/core/formatters/console_codes"
require "rspec/core/formatters/documentation_formatter"

module RSpec
  module Specify
    class Formatter < ::RSpec::Core::Formatters::DocumentationFormatter
      ::RSpec::Core::Formatters.register(
        self,
        :example_started, :example_passed
      )

      def example_started(notification)
        return unless notification.example.metadata[:with_steps]

        indentation = current_indentation
        description = notification.example.description

        full_message = "#{indentation}#{description}"
        output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :default)
      end

      def example_passed(notification)
        super unless notification.example.metadata[:with_steps]
      end
    end
  end
end
