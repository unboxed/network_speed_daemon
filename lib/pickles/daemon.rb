require "pickles/daemon/runner"
require "pickles/daemon/speed"
require "pickles/daemon/version"

module Pickles
  module Daemon
    def self.run(options = {})
      Runner.new(options).run
    end
  end
end
