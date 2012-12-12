require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class Get < Basic
      def perform(command)
        `#{command}`.strip
      end
    end
  end
end
