require 'minitest/autorun'
require 'lynx/command/basic'
require 'lynx/pipe/get'

describe Lynx::Pipe::Get do
  def setup
    @config = Lynx::Config.new
    @command = Lynx::Command::Basic.new(@config).mysql
    @command.batch.no_names.sql("select 100")
    @pipe = Lynx::Pipe::Get.new
  end

  def test_perform
    assert_equal '100', @pipe.perform(@command)
  end
end
