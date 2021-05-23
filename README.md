# Engineering Challenge

## About this Project
This is the take home challenge associated with a software engineering position interview. The challenge was to create and implement a card shuffler.

## Table of Contents

  - [Getting Started](#getting-started)
  - [Design](#design)
  - [Running the Shuffler](#running-the-shuffler)
  - [Running the Tests](#running-the-tests)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Author](#author)

## Getting Started

- To get the card shuffler running, please fork and clone down the repo.
`git clone git@github.com:<your github handle>/engineering_challenge.git`

- To run this code you will need Ruby 2.5.3.

- If you do not already have Ruby installed, follow these [instructions](https://www.ruby-lang.org/en/documentation/installation/)

## Design

### Overview

This challenge is designed to created an automated card shuffler. It defaults to a standard 52-card deck, with four suits (heart, diamond, club, and spade) and 13 cards per suit (2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace). However, the user has the option to create a custom deck when playing a game that does not use a standard deck (pinochle, multiplayer gin rummy, uno, etc.).

### Card Class
#### Initialization
An instance of the `Card` class is initialized with, and has two attributes: `suit` and `value`. There are no additional methods or attributes associated with the `Card` class, as the scope of this challenge is geared more towards manipulating a deck of multiple cards.

### Deck Class  
#### Initialization
An instance of the `Deck` class has three attributes: `valid_suits`, `valid_values,`, and `cards`. As mentioned above in the `Overview` section, an instance of the `Deck` class does not need to be initialized with those arguments.

`Deck.new` will create a standard 52-card deck, with the `valid_suits` and `valid_values` attributes being set to `["diamond", "heart", "spade", "club"]` and `["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]` by default, respectively.

`Deck.new(["diamond", "heart", "spade", "club"], ["9", "9", "10", 10", "Jack", "Jack", "Queen", "Queen", "King", "King", "Ace", "Ace"])` will create a custom deck of cards (in this particular example, a standard pinocle deck). Notice there are two arguments provided, which correspond to two attributes of the `Deck` class: `valid_suits` and `valid_values`. Also notice that both of these arguments are arrays. If the user enters a data type other than arrays for these arguments, the instances of the `Card` class, which make up the `cards` attribute in the `Deck` class, will not be created. More on that below.

#### Populating the Deck with Card Objects
The `valid_suits` and `valid_values` attributes of the `Deck` class were described in the `Initialization` section above. Here, the third and final `Deck` class attribute, `cards` will be discussed. The `cards` attribute is set equal to the `#valid_deck_parameters` instance method, which runs upon initializing of a `Deck` class instance.

##### #valid_deck_parameters
The `#valid_deck_parameters` method contains a guard clause to make sure that the `valid_suits` and `valid_values` attributes of the `Deck` instance are indeed arrays. If either of the attributes' data types are non-arrays, `#valid_deck_parameters` will set the value of the `cards` attribute to `nil`. If `valid_suits` and `valid_values` are both arrays, `#valid_deck_parameters` will call `#create_deck`.

##### #create_deck
As the name may imply, the `#create_deck` method creates the actual deck of cards. It iterates through the `valid_suits` and `valid_values` arrays to populate the `cards` attribute of the `Deck` instance with instances of the `Card` class.

#### Shuffling the Deck
There are two approaches to shuffling the deck of cards:
1. Using the built-in Ruby `#shuffle` method
1. Hand-rolling and creating a custom shuffle method

For showcase purposes, this challenge shuffles the deck via `approach 2`. However, implementation of `approach 1` is included in the `./lib/deck.rb` file and commented out on `lines 31-35`.

##### #shuffle_deck
The `#shuffle_deck` method is a guard clause to make sure that there are indeed `Card` objects in the deck to be shuffled. If there are cards in the deck, `#shuffle_deck` calls `#manual_shuffle`. If there are not, then the `cards` attribute for the deck remains set to `nil`.

##### #manual_shuffle
`#manual_shuffle` selects a random card from the existing deck, copies it, inserts it into a new array, and then deletes that card from the existing deck. This process is repeated until all cards are removed from the existing deck and inserted into the new temporary array. Once this is achieved, the deck's `cards` attribute is set equal to this new array - thus, shuffling the deck.

#### Displaying Shuffle
##### #show_cards
`#show_cards` is another guard clause-based method. It first checks to see if there are any cards in the deck. If there aren't, it returns
```
"We were unable to process this request because your deck parameters are invalid. If you would like a custom deck, please makes sure you are entering two parameters, and that they are both arrays. If you would like a standard 52-card deck, please remove all parameters"
```
If there cards in the deck, `#show_cards` will call the previously discussed `#shuffle_deck`, and then `#show_valid_cards`.

##### #show_valid_cards
`#show_valid_cards` iterates through every card in the deck, and displays the card's information in the following format:
`"Card #1: Queen of hearts"`

## Running The Shuffler

- To see the shuffler in action, run `ruby lib/runner.rb` from the command line interface (CLI).
- To see a shuffled, custom deck, manipulate the code on `line 4` of the `./lib/runner.rb` file. Remember, the two arguments need to be arrays! First array corresponds to the desired suits in the custom deck, the second array corresponds to the desired values in the custom deck.

## Running the tests
- There are two test files associated with this challenge; `./test/card_test.rb` and `./test/deck_test.rb`.
- These tests are executed by running `ruby test/card_test.rb ` and `ruby test/deck_test.rb` from the CLI.
- Full test coverage was confirmed using SimpleCov

## Built With
- Ruby
- SimpleCov

## Versioning
- Ruby 2.5.3

## Author
- **Tommy Nieuwenhuis**
|  [GitHub](https://github.com/tsnieuwen) |
    [LinkedIn](https://www.linkedin.com/in/thomasnieuwenhuis/)
