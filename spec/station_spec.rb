require 'station'
describe Station do

  let(:zone) { 1 }
  subject(:station) { described_class.new("Victoria", zone) }
  # let(:name) { "Victoria" }

  it "has a station name" do
    expect(station.name).to eq "Victoria"
  end

  it "has a zone" do
    expect(station.zone).to eq zone
  end
end
