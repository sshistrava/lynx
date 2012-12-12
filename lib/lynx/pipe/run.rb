require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class Run < Basic
      def perform(command)
        system(command.to_s)
      end
    end
  end
end
