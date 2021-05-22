require './lib/card'

class Deck
  attr_reader :valid_suits,
              :valid_values,
              :cards

  def initialize(valid_suits = ["diamond", "heart", "spade", "club"], valid_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"])
    @valid_suits = valid_suits
    @valid_values = valid_values
    @cards = create_deck
  end

  def create_deck
    if @valid_suits.class == Array && @valid_values.class == Array
      @cards = @valid_suits.flat_map do |suit|
        @valid_values.map do |value|
          Card.new(suit, value)
        end
      end
    else
      nil
    end
  end

### This shuffle_deck method just uses the built-in ruby #shuffle method
  # def shuffle_deck
  #   if @cards.nil?
  #     "We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two paramenters, and that they are both arrays"
  #   else
  #     @cards = @cards.shuffle
  #   end
  # end

### This shuffle deck method and associated helper methods shuffle the deck without using the built-in ruby method
  def shuffle_deck
    if @cards.nil?
      "We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two paramenters, and that they are both arrays"
    else
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
    @cards = fresh_shuffle
  end



end
