require 'lynx/config'

module Lynx
  module Command
    class Basic
      attr_reader :config

      class << self
        # A declarative way to generate chaining commands.
        def instruct(method, &block)
          define_method(method) do |*args|
            @command << block.call(self,*args)
            self
          end
        end
      end

      def initialize(config)
        @config = config
        @command = []
      end

      def option(option)
        @command << option

        self
      end

      def authorize
        @command << "--defaults-extra-file=#{config.credentials}" if config.credentials
        @command << "--user=#{config.username}" if config.username
        @command << "--host=#{config.host}" if config.host
        @command << "--socket=#{config.socket}" if config.socket

        self
      end

      instruct(:mysql){ |c| c.config.mysql }
      instruct(:dump){ |c| c.config.dump }
      instruct(:with_database){ |c| "--database=#{c.config.database}" }
      instruct(:sql){ |c, sql| "--execute='#{sql}'" }
      instruct(:batch){ '--batch' }
      instruct(:no_names){ '--skip-column-names' }
      instruct(:compress){ '--compress' }
      instruct(:skip_add_drop_table){ '--skip-add-drop-table' }
      instruct(:skip_add_locks){ '--skip-add-locks' }
      instruct(:skip_comments){ '--skip-comments' }
      instruct(:skip_quote_names){ '--skip-quote-names' }
      instruct(:no_data){ '--no-data' }
      instruct(:skip_triggers){ '--skip-triggers' }
      instruct(:compact){ '--compact' }
      instruct(:ignore){ |c,table| "--ignore-table=#{c.config.database}.#{table}" }
      instruct(:no_create_info){ '--no-create-info' }
      instruct(:no_create_db){ '--no-create-db' }

      def to_s
        @command.join(' ')
      end
    end
  end
end
