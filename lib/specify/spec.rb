module Specify
  module Spec
    # rubocop:disable Metrics/MethodLength
    def self.included(caller)
      caller.instance_eval do
        alias :Feature    :context
        alias :feature    :context
        alias :Ability    :context
        alias :ability    :context
        alias :Component  :context
        alias :component  :context
        alias :Workflow   :context
        alias :workflow   :context
        alias :Service    :context
        alias :service    :context

        alias :Background :before
        alias :Setup      :before
        alias :Teardown   :after
        alias :Cleanup    :after
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end

# rubocop:disable Naming/MethodName
def self.Feature(*args, &block)
  RSpec.describe(*args, &block)
end

def self.feature(*args, &block)
  RSpec.describe(*args, &block)
end

def self.Story(*args, &block)
  RSpec.describe(*args, &block)
end

def self.story(*args, &block)
  RSpec.describe(*args, &block)
end
# rubocop:enable Naming/MethodName

RSpec.configuration.include Specify::Spec
