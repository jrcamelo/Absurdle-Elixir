defmodule Absurdle do

  def new_game do
    valid_words = Words.read_valid_words
    answer = Words.get_random_secret_word
    Guesser.take_guess(answer, valid_words)
  end
end
