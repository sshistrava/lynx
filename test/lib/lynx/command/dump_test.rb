require 'minitest/autorun'
require 'lynx/command/dump'

describe Lynx::Command::Dump do
  def setup
    @config = Lynx::Config.new(dump: 'dump', database: 'foo')
    @command = Lynx::Command::Dump.new(@config)
  end

  def test_command
    @command.table('bar')
    @command.where('1=1')

    assert_equal "dump --tables bar --where='1=1'", @command.to_s
  end

  def test_with_database
    assert_equal "dump --databases foo", @command.with_database.to_s
  end
end
