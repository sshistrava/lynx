require 'lynx/pipe/basic'

module Lynx
  module Pipe
    class Import < Basic
      def initialize(file)
        @file = file
      end

      def perform(command)
        system("cat #{@file} | #{command}")
      end
    end
  end
end
