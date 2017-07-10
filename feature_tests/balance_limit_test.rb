require './lib/oystercard.rb'

# USER STORY
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

card = Oystercard.new

card.top_up(91)

# Expect an error message as limit is £90
