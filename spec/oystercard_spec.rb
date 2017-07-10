require './lib/oystercard.rb'

describe Oystercard do
  subject(:card) { described_class.new }

  it 'creates card' do
   expect(card).to respond_to(:balance)
  end

  it 'has initial balance of 0' do
    expect(card).to have_attributes(:balance => 0)
  end

  describe '#top_up' do
    it 'increments the card balance' do
      expect { card.top_up(1) }.to change { card.balance }.by 1
    end

    it 'enforces max balance of £90' do
      max_balance = Oystercard::MAX_BALANCE
      expect { card.top_up(max_balance + 1) }.to raise_error ("Top up limit is £#{max_balance}")
    end
  end

  describe '#deduct' do
    it 'deducts an amount from the balance' do
      subject.top_up(20)
      expect { card.deduct(1) }.to change { card.balance }.by -1
    end
  end
end
