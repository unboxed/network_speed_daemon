module Speed
  module Daemon
    class Network
      def name
        `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`.chomp
      end
    end
  end
end
