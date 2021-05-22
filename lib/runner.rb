require './lib/card'
require './lib/deck'

deck = Deck.new
require "pry"; binding.pry
puts deck.show_shuffled_cards
