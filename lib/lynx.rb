require 'lynx/version'
require 'lynx/config'
require 'lynx/command'
require 'lynx/pipe'
require 'lynx/d_s_l'

require 'erb'
require 'yaml'

module Lynx
  class << self
    def config(options)
      Lynx::DSL.new(options)
    end

    def rails(env = nil)
      if defined?(Rails)
        env ||= Rails.env
        hash = Rails.configuration.database_configuration
      elsif File.exists?('config/database.yml')
        hash = YAML::load(ERB.new(IO.read('config/database.yml')).result)
      else
        raise RuntimeError, 'unable to find configuration file'
      end

      config(hash[env.to_s])
    end

    def append(*args)
      Pipe::Append.new(*args)
    end

    def run
      Pipe::Run.new
    end

    def get
      Pipe::Get.new
    end

    def write(*args)
      Pipe::Write.new(*args)
    end

    def import(*args)
      Pipe::Import.new(*args)
    end

    def debug(*args)
      Pipe::Debug.new(*args)
    end
  end
end
