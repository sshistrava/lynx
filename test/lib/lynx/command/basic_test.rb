require 'minitest/autorun'
require 'lynx/command/basic'

describe Lynx::Command::Basic do
  def setup
    @config = Lynx::Config.new(
      dump: 'mysqldump',
      database: 'foo',
      mysql: 'mysql')
    @command = Lynx::Command::Basic.new(@config)
  end

  def test_mysql
    assert_equal 'mysql', @command.mysql.to_s
  end

  def test_dump
    assert_equal 'mysqldump', @command.dump.to_s
  end

  def test_with_database
    assert_equal 'mysql --database=foo', @command.mysql.with_database.to_s
  end

  def test_batch
    assert_equal 'mysql --batch', @command.mysql.batch.to_s
  end

  def test_authorize_with_username
    @command.config.stub(:username, 'foo') do
      assert_equal 'mysql --user=foo', @command.mysql.authorize.to_s
    end
  end

  def test_authorize_with_socket
    @command.config.stub(:socket, '/foo/bar') do
      assert_equal 'mysql --socket=/foo/bar', @command.mysql.authorize.to_s
    end
  end

  def test_authorize_with_host
    @command.config.stub(:host, 'local') do
      assert_equal 'mysql --host=local', @command.mysql.authorize.to_s
    end
  end

  def test_compress
    assert_equal 'mysql --compress', @command.mysql.compress.to_s
  end
end
