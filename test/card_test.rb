require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new(:diamond, 'Queen')

    assert_instance_of Card, card
  end

  def test_it_has_readable_attributes
    card = Card.new(:diamond, 'Queen')

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.value
  end
end
