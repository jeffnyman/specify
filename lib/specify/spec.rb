module Specify
  module Spec
    def self.included(caller)
      caller.instance_eval do
        alias :Feature :context
      end
    end
  end
end

# rubocop:disable Naming/MethodName
def self.Feature(*args, &block)
  RSpec.describe(*args, &block)
end
# rubocop:enable Naming/MethodName

RSpec.configuration.include Specify::Spec
