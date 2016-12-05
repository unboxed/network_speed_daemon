module Pickles
  module Daemon
    class Runner
      def initialize(speed:, network:)
        @speed = speed
        @network = network
      end

      def run
        loop do
          puts({
            host_name: `hostname`.chomp,
            network_name: network.name,
            download_speed: speed.download,
          })
        end
      end

      private

      attr_reader :speed, :network
    end
  end
end
