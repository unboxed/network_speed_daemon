require "spec_helper"

RSpec.describe Speed::Daemon::Speed do
  describe "#download" do
    it "returns the download speed in Mbps" do
      speed = described_class.new

      allow(speed).to receive(:`).and_return("1230332.00")

      expect(speed.download).to eq 9.39
    end
  end
end
