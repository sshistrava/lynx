module Lynx
  class Config
    MYSQL = ['mysql', '/usr/local/bin/mysql', '/usr/local/mysql/bin/mysql']

    DUMP = ['mysqldump']

    def initialize(config = {})
      @config = config
    end

    [:credentials, :username, :host, :database, :socket].each do |method|
      define_method(method){ self[method] }
    end

    def mysql
      @mysql ||= self[:mysql] || detect(MYSQL) || raise(Lynx::Error, 'Failed to detect a valid version of mysql')
    end

    def dump
      @dump ||= self[:dump] || detect(DUMP) || raise(Lynx::Error, 'Failed to detect a valid version of mysqldump')
    end

    private

    def [](key)
      @config[key.to_sym] || @config[key.to_s]
    end
    def detect(commands)
      commands.detect{ |c| system("which #{c} >/dev/null") }
    end
  end
end
