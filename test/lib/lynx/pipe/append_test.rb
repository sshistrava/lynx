require 'minitest/autorun'
require 'lynx/command/basic'
require 'lynx/pipe/append'

describe Lynx::Pipe::Append do
  before do
    system("rm -rf append_test")
    @config = Lynx::Config.new
    @command = Lynx::Command::Basic.new(@config).mysql
    @command.batch.no_names.sql("select 100")
    @pipe = Lynx::Pipe::Append.new('append_test')
  end

  after do
    system("rm -rf append_test")
  end

  def test_perform
    @pipe.perform(@command)
    @pipe.perform(@command)
    assert_equal "100\n100", File.read('append_test').strip
  end
end
