require 'minitest/autorun'
require 'lynx/d_s_l'

describe Lynx::DSL do
  def setup
    @dsl = Lynx::DSL.new({host: 'local'})
  end

  it 'passes the config to the commands' do
    assert_equal 'local', @dsl.select.config.host
    assert_equal 'local', @dsl.structure.config.host
    assert_equal 'local', @dsl.dump.config.host
  end
end
