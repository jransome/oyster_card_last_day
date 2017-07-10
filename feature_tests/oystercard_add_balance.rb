require './lib/oystercard.rb'

# USER STORY
# In order to use public transport
# As a customer
# I want money on my card

balance = 0
oystercard = Oystercard.new(balance)
p oystercard
