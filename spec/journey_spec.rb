require 'journey'

describe Journey do
let(:entry_station) { instance_double("Station") }
let(:exit_station) { instance_double("Station") }
subject(:journey) { described_class.new(entry_station) }

  context 'journey started' do
    it 'is initialized with a entry_station' do
      expect(journey.entry_station).to eq entry_station
    end

    it 'calculates the fare as a penalty by default' do
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end

    it 'is in a journey' do
      expect(journey).to be_in_journey
    end
  end

  context 'journey finished' do
    before do
      journey.end_journey(exit_station)
    end

    it 'it records the exit station' do
      expect(journey.exit_station).to eq exit_station
    end

    it 'calculates the fare as the minimum fare' do
      expect(journey.fare).to eq described_class::MINIMUM_FARE
    end

    it 'is no longer in a journey' do
      expect(journey).to_not be_in_journey
    end
  end

end
