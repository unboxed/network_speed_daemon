module Pickles
  module Daemon
    class Speed
      def download
        megabits_per_second
      end

      private

      def megabits_per_second
        (bytes_per_second / 131072).round(2)
      end

      def bytes_per_second
        `curl -o /dev/null -s -w %{speed_download} #{file_url}`.to_f
      end

      def file_url
        "http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
      end
    end
  end
end
