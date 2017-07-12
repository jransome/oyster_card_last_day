require 'journey'

describe Journey do
#subject(:journey) {described_class.new(entry_stn = Station.new(name,zone))}
subject(:journey) {described_class.new("Paddington", 1)}
let(:name) {"Victoria"}
let(:zone) {1}




  context 'start journey' do
    it 'is initialized with a entry_station' do
      expect(journey.entry_station).to be_a Station
    end
  end

  context 'end journey' do

    it 'it records the exit station' do
      journey.end_journey(name,zone)
      expect(journey.exit_station).to be_a Station
    end
  end

end
