-- Starman
-- In this single-player, text-based game,
-- there is a word which the player needs to guess.
-- For each turn of the game, the player guesses a single letter.
-- If that letter is correct,
-- then the guessed letters are displayed in the correct places in the word.
-- If that letter is incorrect,
-- then the user loses a star.
-- Once the user has no stars left, they have lost the game.
-- However if the user guesses all the letters in the word, they have won the game.

import Data.List

getWord =
  do
    putStrLn "Word to use? :"
    getLine

guessLetter =
  do
    putStrLn "Guess Letter? :"
    getLine !! 0

isGuessCorrect guess word =
  elem guess word

word = getWord

starman stars correctGuesses =
  let
    letter = guessLetter
  in
    if stars == 0 then
      putStrLn "Game Over"
    else if (correctGuesses == (length word)) then
      putStrLn "Congrats. You Won the game!"
    else if (isGuessCorrect guess word) then
      putStrLn "Congrats. You guessed correctly!"
      starman(stars, correctGuesses + 1)
    else
      starman(stars - 1, correctGuesses)

startGame = starman(5 0)
