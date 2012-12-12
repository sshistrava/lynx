require 'minitest/autorun'
require 'lynx/command/basic'
require 'lynx/pipe/write'

describe Lynx::Pipe::Write do
  before do
    system("rm -rf write_test")
    @config = Lynx::Config.new
    @command = Lynx::Command::Basic.new(@config).mysql
    @command.batch.no_names.sql("select 100")
    @pipe = Lynx::Pipe::Write.new('write_test')
  end

  after do
    system("rm -rf write_test")
  end

  def test_perform
    @pipe.perform(@command)
    assert_equal '100', File.read('write_test').strip
  end
end
