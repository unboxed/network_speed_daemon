require "spec_helper"

describe Pickles::Daemon do
  it "has a version number" do
    expect(Pickles::Daemon::VERSION).not_to be nil
  end
end
