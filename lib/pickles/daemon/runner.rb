module Pickles
  module Daemon
    class Runner
      def initialize(options = {})
      end

      def run
        loop do
          puts Speed.new.download
        end
      end
    end
  end
end
