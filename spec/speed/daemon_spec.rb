require "spec_helper"

describe Speed::Daemon do
  it "has a version number" do
    expect(Speed::Daemon::VERSION).not_to be nil
  end
end
