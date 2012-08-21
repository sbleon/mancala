Feature: Start game
  In order to play a game
  As a player
  I want to start a game

  Scenario: Setting up the board
    Given I am not playing a game yet
    When I start a game
    Then I see a game board
