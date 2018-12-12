module RSpec
  module Specify
    module World
      def shared_example_steps
        @shared_example_steps ||= {}
      end
    end
  end
end
