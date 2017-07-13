require 'journey'

describe Journey do
let(:entry_station) { instance_double("Station") }
let(:exit_station) { instance_double("Station") }
subject(:journey) { described_class.new(entry_station) }

  context 'start journey' do
    it 'is initialized with a entry_station' do
      expect(journey.entry_station).to eq entry_station
    end
  end

  context 'end journey' do

    it 'it records the exit station' do
      journey.end_journey(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

end
