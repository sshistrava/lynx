require 'lynx/config'
require 'lynx/command'

module Lynx
  class DSL
    def initialize(config)
      @config = Lynx::Config.new(config)
    end

    def basic
      Command::Basic.new(@config)
        .mysql
        .authorize
        .with_database
    end

    def create_database
      Command::Basic.new(@config)
        .mysql
        .authorize
        .sql("create database #{@config.database}")
    end

    def create_database_if_not_exists
      Command::Basic.new(@config)
        .mysql
        .authorize
        .sql("create database if not exists #{@config.database}")
    end

    def drop_database
      Command::Basic.new(@config)
        .mysql
        .authorize
        .sql("drop database #{@config.database}")
    end

    def drop_database_if_exists
      Command::Basic.new(@config)
        .mysql
        .authorize
        .sql("drop database if exists #{@config.database}")
    end

    def dump
      Command::Dump.new(@config)
        .authorize
        .with_database
        .skip_quote_names
        .compress
        .compact
        .no_create_db
    end

    def data
      dump.no_create_info
    end

    def structure
      dump.no_data
    end

    def select
      basic
        .batch
        .no_names
        .compress
    end
  end
end
