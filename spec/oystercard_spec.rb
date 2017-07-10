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
  end
end
