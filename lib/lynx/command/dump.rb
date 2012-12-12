require 'lynx/command/basic'

module Lynx
  module Command
    class Dump < Basic
      def initialize(*args)
        super(*args)

        dump
      end

      instruct(:where){ |c,condition| "--where='#{condition}'" }
      instruct(:with_database){ |c| c.database(c.config.database) }

      def database(*args)
        @command << '--databases' unless args.empty?
        @command += args

        self
      end

      def table(*args)
        @command << '--tables' unless args.empty?
        @command += args

        self
      end
    end
  end
end
