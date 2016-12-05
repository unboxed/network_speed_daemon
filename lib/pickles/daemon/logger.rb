module Pickles
  module Daemon
    class Logger
      def initialize(output)
        @output = output
      end

      def log(message)
        output.puts(message)
      end

      private

      attr_reader :output
    end
  end
end
