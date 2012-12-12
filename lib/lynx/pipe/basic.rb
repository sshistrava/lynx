module Lynx
  module Pipe
    class Basic
      def perform(command)
        puts command.to_s
      end

      def clear
        self
      end
    end
  end
end
