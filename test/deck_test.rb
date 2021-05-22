require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'set'
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
    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 52
    assert_equal deck.cards[0].class, Card
    assert_equal deck.cards[51].class, Card
  end

  def test_it_has_readable_attributes_with_instantiation_arguments
    deck = Deck.new(["diamond", "heart", "spade"], ["9", "10", "Jack", "Queen", "King", "Ace"])

    assert_equal deck.valid_suits, ["diamond", "heart", "spade"]
    assert_equal deck.valid_values, ["9", "10", "Jack", "Queen", "King", "Ace"]
    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 18
    assert_equal deck.cards[0].class, Card
    assert_equal deck.cards[17].class, Card
  end

  def test_it_has_readable_attributes_with_invalid_instantiation_arguments
    deck = Deck.new("blackjack", 21)

    assert_equal deck.valid_suits, "blackjack"
    assert_equal deck.valid_values, 21
    assert_nil deck.cards
  end

  def test_create_deck_without_instantiation_arguments
    deck = Deck.new
    deck.create_deck

    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 52
    assert_equal deck.cards[0].class, Card
    assert_equal deck.cards[0].suit, "diamond"
    assert_equal deck.cards[0].value, "2"
    assert_equal deck.cards[51].class, Card
    assert_equal deck.cards[51].suit, "club"
    assert_equal deck.cards[51].value, "Ace"
  end

  def test_create_deck_with_valid_instantiation_arguments
    deck = Deck.new(["diamond", "heart", "spade", "club"], ["9", "10", "Jack", "Queen", "King", "Ace"])
    deck.create_deck

    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 24
    assert_equal deck.cards[0].class, Card
    assert_equal deck.cards[0].suit, "diamond"
    assert_equal deck.cards[0].value, "9"
    assert_equal deck.cards[23].class, Card
    assert_equal deck.cards[23].suit, "club"
    assert_equal deck.cards[23].value, "Ace"
  end

  def test_create_deck_with_invalid_first_argument
    deck = Deck.new(23, ["9", "10", "Jack", "Queen", "King", "Ace"])
    deck.create_deck

    assert_nil deck.cards
  end

  def test_create_deck_with_invalid_second_argument
    deck = Deck.new(["9", "10", "Jack", "Queen", "King", "Ace"], 23)
    deck.create_deck

    assert_nil deck.cards
  end

  def test_create_deck_with_invalid_first_and_second_argument
    deck = Deck.new(112, 23)
    deck.create_deck

    assert_nil deck.cards
  end

  def test_shuffle_no_deck_arguments
    deck = Deck.new
    deck.shuffle_deck

    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 52
  end

  def test_shuffle_with_deck_arguments
    deck = Deck.new(["diamond", "heart", "spade", "club"], ["9", "10", "Jack", "Queen", "King", "Ace"])
    deck.shuffle_deck

    assert_equal deck.cards.class, Array
    assert_equal deck.cards.count, 24
  end

  def test_shuffle_with_invalid_first_argument
    deck = Deck.new(1, ["9", "10", "Jack", "Queen", "King", "Ace"])

    assert_equal deck.shuffle_deck, "We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two paramenters, and that they are both arrays"
  end

  def test_shuffle_with_invalid_second_argument
    deck = Deck.new(["9", "10", "Jack", "Queen", "King", "Ace"], 1)

    assert_equal deck.shuffle_deck, "We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two paramenters, and that they are both arrays"
  end

  def test_shuffle_with_invalid_first_and_second_argument
    deck = Deck.new(23, 1)

    assert_equal deck.shuffle_deck, "We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two paramenters, and that they are both arrays"
  end

  def test_manual_shuffle
    deck = Deck.new
    cards = deck.cards

    assert_equal cards.to_set, deck.manual_shuffle.to_set
  end
end
