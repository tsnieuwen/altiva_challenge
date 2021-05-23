require './lib/card'

class Deck
  attr_reader :valid_suits,
              :valid_values,
              :cards

  def initialize(valid_suits = ["diamond", "heart", "spade", "club"], valid_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"])
    @valid_suits = valid_suits
    @valid_values = valid_values
    @cards = valid_deck_parameters
  end

  def valid_deck_parameters
    if @valid_suits.class == Array && @valid_values.class == Array
      create_deck
    else
      nil
    end
  end

# This #create_deck method is easier to read and understand, but it less performant then the method below

  # def create_deck
  #   @cards = @valid_suits.flat_map do |suit|
  #     @valid_values.map do |value|
  #       Card.new(suit, value)
  #     end
  #   end
  # end

  def create_deck
    suit_counter = 0
    value_counter = 0
    deck =[]
    until deck.count == (@valid_suits.count * @valid_values.count)
      deck << Card.new(@valid_suits[suit_counter], @valid_values[value_counter])
      value_counter += 1
      value_counter = 0 if (value_counter == @valid_values.count)
      suit_counter += 1 if (deck.count == (suit_counter + 1) * (@valid_values.count))
    end
    deck
  end

### This shuffle_deck method just uses the built-in ruby #shuffle method
  # def shuffle_deck
  #   if !@cards.nil?
  #     @cards = @cards.shuffle
  #   end
  # end

### The following two methods shuffle the deck of cards without using the built-in ruby #shuffle method
  def shuffle_deck
    if !@cards.nil?
      @cards = manual_shuffle
    end
  end

  def manual_shuffle
    fresh_shuffle = []
    until @cards.empty?
      random_card = @cards.sample
      fresh_shuffle << random_card
      @cards.delete(random_card)
    end
    fresh_shuffle
  end

  def show_cards
    if @cards.nil?
      "We were unable to process this request because your deck parameters are invalid." "\n" "If you would like a custom deck, please makes sure you are entering two parameters, and that they are both arrays." "\n" "If you would like a standard 52-card deck, please remove all parameters."
    else
      shuffle_deck
      show_valid_cards
    end
  end

  def show_valid_cards
    counter = 1
    output = ""
    @cards.each do |card|
      output += "Card ##{counter}: #{card.value} of #{card.suit}s" "\n"
      counter += 1
    end
    output
  end

end
