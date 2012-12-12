require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class Debug < Basic
      def initialize(pipe = nil, io = STDOUT)
        @pipe = pipe
        @io = io
      end

      def perform(command)
        @io.puts "[Lynx] #{filter(command)}"

        @pipe.perform(command) if has_pipe?
      end

      def clear
        @pipe.clear

        self
      end

      private

      def filter(command)
        command.to_s.gsub(/--password=.*?\s/, '--password=[FILTERED]')
      end

      def has_pipe?
        !!@pipe
      end
    end
  end
end
