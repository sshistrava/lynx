require 'lynx/pipe/basic'
require 'lynx/system_out'

module Lynx
  module Pipe
    class Run < Basic
      def perform(command)
        SystemOut.run(command.to_s)
      end
    end
  end
end
