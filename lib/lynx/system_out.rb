require 'open3'
require 'lynx/error'

module Lynx
  module SystemOut
    def self.run(command)
      stdout, stderr, status = Open3.capture3(command)
      unless status.success?
        raise(Lynx::Error, "Failed to perform: #{command} \n STDERR: #{stderr}")
      end
      stdout
    end
  end
end
