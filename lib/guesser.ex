defmodule Guesser do
  def take_guess(answer, valid_words), do: take_guess(answer, valid_words, 5)

  def take_guess(answer, valid_words, lives) do
    { valid, guess } = get_guess(valid_words)
    if !valid do
      IO.puts "Invalid word"
      take_guess(answer, valid_words, lives)
    else
      evaluate_guess(answer, guess, valid_words, lives)
    end
  end

  def get_guess(valid_words) do
    guess = IO.gets("\nPlease enter a word\n")
    |> String.trim
    |> String.downcase
    { Enum.member?(valid_words, guess), guess }
  end

  def evaluate_guess(answer, guess, valid_words, lives) do
    if guess == answer do
      IO.puts "You win!"
    else
      if (lives < 2) do
        IO.puts "You lose!"
        IO.puts "The answer was #{answer}"
      else
        if (lives == 2) do
          IO.puts "This will be your last guess"
        else
          IO.puts "You have #{lives-1} guesses left"
        end
        print_guess_letters(guess, answer)
        take_guess(answer, valid_words, lives-1)
      end
    end
  end

  def print_guess_letters(guess, answer) do
    for i <- 0..4 do
      guess_char = String.at(guess, i)
      answer_char = String.at(answer, i)
      if guess_char == answer_char do
        IO.write "[#{String.upcase(guess_char)}]"
      else
        if String.contains?(answer, guess_char) do
          IO.write "[#{guess_char}]"
        else
          IO.write "#{guess_char}"
        end
      end
    end
    IO.puts "\n"
  end
end
