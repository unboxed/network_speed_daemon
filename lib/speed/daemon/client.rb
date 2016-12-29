require "json"

module Speed
  module Daemon
    class Client

      def initialize(client)
        @client = client
      end

      def update_speed_metrics(metrics)
        client.post do |request|
          request.url "/speed_metrics.json"
          request.headers["Content-Type"] = "application/json"
          request.body = metrics.to_json
        end
      end

      private

      attr_reader :client
    end
  end
end
