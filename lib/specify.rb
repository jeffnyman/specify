require "specify/version"

require "specify/spec"
require "specify/rspec/reporter"
require "specify/rspec/formatter"
require "specify/rspec/notification"
require "specify/rspec/example_group"

module Specify
  ::RSpec::Core::ExampleGroup.define_example_method :Scenario, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Condition, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Behavior, has_steps: true

  ::RSpec::Core::ExampleGroup.send :include, RSpec::Specify::ExampleGroup
  ::RSpec::Core::Reporter.send :include, RSpec::Specify::Reporter
end
