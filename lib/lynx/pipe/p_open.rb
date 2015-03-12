require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class POpen < Basic

      def initialize(logger)
        @logger = logger
      end

      def perform(command)
        IO.popen(command.to_s) do |io|
          while (line = io.gets) do
            @logger.info("[Lynx:POpen] #{line}") if @logger
          end
        end
      end
    end
  end
end
