require 'lynx/command/basic'

module Lynx
  module Command
    class Dump < Basic
      def initialize(*args)
        super(*args)

        @database = '--all-databases'
        @tables = []

        dump
      end

      instruct(:where){ |c,condition| "--where='#{condition}'" }
      instruct(:complete_insert){ '--complete-insert' }

      def with_database
        @database = @config.database

        self
      end

      def table(*args)
        @tables += args

        self
      end

      def to_s
        "#{super} #{@database} #{@tables.join(' ')}"
      end
    end
  end
end
