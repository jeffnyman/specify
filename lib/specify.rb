require "specify/version"

require "specify/rspec/formatter"

module Specify
  ::RSpec::Core::ExampleGroup.define_example_method :Scenario, with_steps: true
end
