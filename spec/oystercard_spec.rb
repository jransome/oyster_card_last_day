require './lib/oystercard.rb'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:top_up) { 50 }
  let(:max_balance) { described_class::MAX_BALANCE }
  let(:minumum_balance) { 1 }

  it 'creates card' do
   expect(card).to respond_to(:balance)
  end

  it 'has initial balance of 0' do
    expect(card).to have_attributes(balance: 0)
  end

  it "raises an error if there is not enough funds for the minimum fare" do
    expect { card.touch_in }.to raise_error "Insufficient funds"
  end

  context '#top_up' do
    it 'increments the card balance' do
      expect { card.top_up(top_up) }.to change { card.balance }.by top_up
    end

    it 'enforces max balance of £90' do
      expect { card.top_up(max_balance + 1) }.to raise_error ("Top up limit is £#{max_balance}")
    end
  end

  context '#deduct' do
    it 'deducts an amount from the balance' do
      subject.top_up(top_up)
      expect { card.deduct(1) }.to change { card.balance }.by -1
    end
  end

context 'requires top-up to travel' do
  before { card.top_up(max_balance) }

    describe '#in_journey?' do
      it 'is initially not in a journey' do
        expect(card.in_journey?).to be false
      end
    end

    describe '#touch_in' do
      it 'confirms in journey if touched in' do
        card.touch_in
        expect(card).to be_in_journey
      end
    end

    describe '#touch_out' do
      it 'confirm out of journey if touched out' do
        card.touch_out
        expect(card).not_to be_in_journey
      end
    end

      it "requires a minimum balance on a card to start a journey" do
        expect(card.balance).to satisfy { |balance| balance >= minumum_balance }
      end

  end
end
