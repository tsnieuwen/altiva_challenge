require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists_without_instantiation_arguments
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_it_exists_with_instantiation_arguments
    deck = Deck.new(["diamond", "heart", "spade", "club"], ["9", "10", "Jack", "Queen", "King", "Ace"])

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes_without_instantiation_arguments
    deck = Deck.new

    assert_equal deck.valid_suits, ["diamond", "heart", "spade", "club"]
    assert_equal deck.valid_values, ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    assert_nil deck.cards
  end

  def test_it_has_readable_attributes_with_instantiation_arguments
    deck = Deck.new(["diamond", "heart", "spade"], ["9", "10", "Jack", "Queen", "King", "Ace"])

    assert_equal deck.valid_suits, ["diamond", "heart", "spade"]
    assert_equal deck.valid_values, ["9", "10", "Jack", "Queen", "King", "Ace"]
    assert_nil deck.cards
  end
end
