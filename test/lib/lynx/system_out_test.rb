require 'minitest/autorun'
require 'lynx/system_out'
require 'lynx/error'
require 'open3'

describe Lynx::SystemOut do

  def setup
    @command = 'command'
    @stdout = 'stdout'
    @stderr = 'stderr'
  end

  it 'should return standard out if command is a success' do
    mock_process = Minitest::Mock.new
    def mock_process.success?
      true
    end

    Open3.stub(:capture3, [@stdout, @stderr, mock_process]) do
      assert_equal(@stdout, Lynx::SystemOut.run(@command))
    end
  end

  it 'should raise a Lynx::Error if command is not a success' do
    mock_process = Minitest::Mock.new
    def mock_process.success?
      false
    end

    Open3.stub(:capture3, [@stdout, @stderr, mock_process]) do
      err = assert_raises Lynx::Error do
        Lynx::SystemOut.run(@command)
      end
      assert_match"Failed to perform: #{@command} \n STDERR: #{@stderr}", err.message
    end
  end
end
