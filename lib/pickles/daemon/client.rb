require "json"

module Pickles
  module Daemon
    class Client

      def initialize(client)
        @client = client
      end

      def update_speed_metrics(metrics)
        client.post do |request|
          request.url "speed_metrics"
          request.headers["Content-Type"] = "application/json"
          request.body = metrics.to_json
        end
      end

      private

      attr_reader :client
    end
  end
end
