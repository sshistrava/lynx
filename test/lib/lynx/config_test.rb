require 'minitest/autorun'
require 'lynx/config'

describe Lynx::Config do
  def config
    @config ||= Lynx::Config.new(
      database: 'lynx',
      credentials: '/foobar.cnf',
      username: 'name',
      host: 'localhost',
      socket: '/foo/bar')
  end

  it 'knows the mysql command' do
    Kernel.stub(:system, true) do
      assert_equal 'mysql', config.mysql
    end
  end

  it 'recognizes string parameters' do
    assert_equal 'lqsym', Lynx::Config.new('mysql' => 'lqsym').mysql
  end

  it 'knows the dump command' do
    Kernel.stub(:system, true) do
      assert_equal 'mysqldump', config.dump
    end
  end

  it 'knows the database' do
    assert_equal 'lynx', config.database
  end

  it 'knows the credentials' do
    assert_equal '/foobar.cnf', config.credentials
  end

  it 'knows the username' do
    assert_equal 'name', config.username
  end

  it 'knows the socket' do
    assert_equal '/foo/bar', config.socket
  end

  it 'knows the host' do
    assert_equal 'localhost', config.host
  end
end
