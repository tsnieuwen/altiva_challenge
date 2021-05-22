require './lib/card'
require './lib/deck'

deck = Deck.new
deck.shuffle_deck
puts deck.show_cards
