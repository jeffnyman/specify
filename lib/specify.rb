require "specify/version"

require "specify/spec"
require "specify/rspec/world"
require "specify/rspec/reporter"
require "specify/rspec/formatter"
require "specify/rspec/notification"
require "specify/rspec/example_group"

require "specify/rspec/shared_steps"

module Specify
  include RSpec::Specify::SharedSteps

  ::RSpec::Core::ExampleGroup.define_example_method :Scenario, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Condition, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Behavior, has_steps: true

  ::RSpec::Core::ExampleGroup.define_example_method :scenario, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :condition, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :behavior, has_steps: true

  ::RSpec::Core::ExampleGroup.define_example_method :Steps, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Tests, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Rules, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :Facts, has_steps: true

  ::RSpec::Core::ExampleGroup.define_example_method :steps, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :rules, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :tests, has_steps: true
  ::RSpec::Core::ExampleGroup.define_example_method :facts, has_steps: true

  ::RSpec::Core::ExampleGroup.send :include, RSpec::Specify::ExampleGroup
  ::RSpec::Core::Reporter.send :include, RSpec::Specify::Reporter
  ::RSpec::Core::World.send :include, RSpec::Specify::World
end
