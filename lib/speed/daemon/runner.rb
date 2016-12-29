module Speed
  module Daemon
    class Runner
      def initialize(speed:, network:, client:, logger:)
        @speed = speed
        @network = network
        @client = client
        @logger = logger
      end

      def run
        client.update_speed_metrics(stats).tap do |response|
          logger.log("STATUS: #{response.status}; BODY: #{response.body}")
        end
      end

      private

      attr_reader :speed, :network, :client, :logger

      def stats
        {
          host_name: `hostname`.chomp,
          network_name: network.name,
          download_speed: speed.download,
        }.tap { |stats| logger.log(stats) }
      end
    end
  end
end
