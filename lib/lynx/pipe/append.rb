require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class Append < Basic
      def initialize(file)
        @file = file
      end

      def perform(command)
        system("#{command} >> #{@file}")
      end

      def clear
        system("rm -rf #{@file}")

        self
      end
    end
  end
end
