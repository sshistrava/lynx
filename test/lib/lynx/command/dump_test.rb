require 'minitest/autorun'
require 'lynx/command/dump'

describe Lynx::Command::Dump do
  def setup
    @config = Lynx::Config.new(dump: 'dump', database: 'foo')
    @command = Lynx::Command::Dump.new(@config)
  end

  def test_command
    @command.with_database
    @command.table('bar')
    @command.where('1=1')

    assert_equal "dump --where='1=1' foo bar", @command.to_s
  end
end
