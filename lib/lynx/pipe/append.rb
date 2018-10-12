require 'lynx/pipe/basic'
require 'lynx/system_out'

module Lynx
  module Pipe
    class Append < Basic
      def initialize(file)
        @file = file
      end

      def perform(command)
        SystemOut.run("#{command} >> #{@file}")
      end

      def clear
        SystemOut.run("rm -rf #{@file}")
        self
      end
    end
  end
end
