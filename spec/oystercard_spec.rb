require './lib/oystercard.rb'

describe Oystercard do
  subject(:card)        { described_class.new }
  let(:top_up)          { 50 }
  let(:max_balance)     { described_class::MAX_BALANCE }
  let(:minumum_balance) { described_class::MIN_BALANCE }
  let(:minumum_fare)    { Journey::MINIMUM_FARE }
  let(:penalty_fare)    { Journey::PENALTY_FARE }
  let(:entry_station)   { double(name: "Victoria", zone: 1) }
  let(:exit_station)    { double(name: "Aldgate East", zone: 1) }

  context 'when instanced' do
    it 'has initial balance of 0' do
      expect(card).to have_attributes(balance: 0)
    end

    it 'has no journey history when created' do
      expect(card.journey_history).to eq []
    end
  end

  describe '#top_up' do
    it 'increments the card balance' do
      expect { card.top_up(top_up) }.to change { card.balance }.by top_up
    end

    it 'enforces max balance of £90' do
      expect { card.top_up(max_balance + 1) }.to raise_error ("Top up limit is £#{max_balance}")
    end
  end

  context 'when balance <= 0' do
   it "requires a minimum balance on a card to start a journey" do
     expect{card.touch_in(entry_station)}.to raise_error("Insufficient funds")
   end
  end

  context 'has funds' do
    before { card.top_up(max_balance) }

    describe '#touch_in' do
      it 'creates a new journey' do
        card.touch_in(entry_station)
        expect(card.journey_history.last).to be_a Journey
      end
    end

    context "touched in" do
      before { card.touch_in(entry_station) }

      it 'creates a journey history record' do
        expect(card.journey_history).to_not eq nil
      end

      it 'has a penalty fare deducted if touched in AGAIN before touching out' do
        expect { card.touch_in(exit_station) }.to change { card.balance }.by -penalty_fare
      end

      it 'deducts an amount from the balance when touching out' do
        expect { card.touch_out(exit_station) }.to change { card.balance }.by -minumum_fare
      end

      it "update the journey history when touching out" do
        card.touch_out(exit_station)
        expect(card.journey_history.last.exit_station).to eq exit_station
      end
    end
  end

end
