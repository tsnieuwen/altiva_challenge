# Altvia Engineering Challenge

## About this Project
This is the take home challenge associated with the software engineering position at Altvia. The challenge was to create and implement a card shuffler.

## Table of Contents

  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [Design](#design)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Author](#author)

## Getting Started

- To get the web application running, please fork and clone down the repo.
`git clone <git@github.com:<your github handle>/altiva_challenge.git>`

- To run this application you will need Ruby 2.5.3.

- If you do not already have Ruby installed, follow these [installation instructions](https://www.ruby-lang.org/en/documentation/installation/)

## Design

### Overview

This challenge is designed to created an automated card shuffler. It defaults to a standard 52-card deck, with four suits (heart, diamond, club, and spade) and 13 cards per suit (2, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace). However, the user has the option of creating a custom deck if they wish to play a card game that does not use a standard deck (pinochle, multiplayer gin rummy, uno, etc.)

### Card Class

An instance of the card class is initialized with and has two attributes, `suit` and `value`. There are no additional methods or attributes associated with the card class, as the scope of this challenge is geared more towards manipulating a deck of multiple cards.

### Deck Class  
#### Initialization
An instance of the deck class has three attributes: `valid_suits`, `valid_values,`, and `cards`. As mentioned about in the `Overview` section, an instance of the deck class does not need to initialized with those arguments.

Running `Deck.new` will create a standard 52-card deck, and the `valid_suits` and `valid_values` attributes are set to `["diamond", "heart", "spade", "club"]` and `["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]` by default, respectively.

Running `Deck.new(["diamond", "heart", "spade", "club"], ["9", "9", "10", 10", "Jack", "Jack", "Queen", "Queen", "King", "King", "Ace", "Ace"])` will create a custom deck of cards (in this particular example, a standard pinocle deck). You will notice there are two arguments provided, which correspond to two attributes of the `deck class`: `valid_suits` and `valid_values`. You will also notice that both of these arguments are arrays. If the user enters a data type other than arrays for these arguments, the instances of the `card` class, which make up the `cards` attribute in the `deck` class, will not be created. More on that below.
#### Populating the Deck with Card Objects
The `valid_suits` and `valid_values` attributes of the `Deck` class were described in the `Initialization` section above. Here, the third and final `Deck` class attributes, `cards` will be discussed. The `cards` attribute is set equal to the `create_deck` instance method, and which runs upon initializing of a `Deck` class instance.
#####
#create_deck





## Running the tests
There are two test files associated with this challenge; `./test/card_test.rb` and `./test/deck_test.rb`.

These tests are executed by running `ruby test/card_test.rb ` and `ruby test/deck_test.rb` in your terminal (one test at a time).

## Built With
- Ruby
- SimpleCov

## Versioning
- Ruby 2.5.3

## Author
- **Tommy Nieuwenhuis**
|  [GitHub](https://github.com/tsnieuwen) |
    [LinkedIn](https://www.linkedin.com/in/thomasnieuwenhuis/)
