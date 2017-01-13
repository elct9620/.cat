require "spec_helper"

describe Cat do
  it "has a version number" do
    expect(Cat::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
