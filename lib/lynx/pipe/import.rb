require 'lynx/pipe/basic'
require 'lynx/system_out'

module Lynx
  module Pipe
    class Import < Basic
      def initialize(file)
        @file = file
      end

      def perform(command)
        SystemOut.run("cat #{@file} | #{command}")
      end
    end
  end
end
