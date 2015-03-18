require 'lynx'
require 'minitest/autorun'
require 'lynx/command/basic'
require 'lynx/pipe/p_open'
require 'logger'

describe Lynx::Pipe::POpen do
  def setup
    @config = Lynx::Config.new
    @command = Lynx::Command::Basic.new(@config).mysql
    @command.batch.no_names.sql("select 100")
    @pipe = Lynx.popen(Logger.new(STDOUT))
  end

  def test_perform
    output = capture_subprocess_io do
      @pipe.perform(@command)
    end
    assert(output.any? { |line| line =~ /POpen.*100/ }, "missing Popen output")
  end
end
