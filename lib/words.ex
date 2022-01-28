defmodule Words do

  def read_file_as_list(filepath) do
    {:ok, content } = File.read("./data/#{filepath}")
    content
    |> String.split("\n", trim: true)
  end

  def get_random_secret_word do
    read_file_as_list("secrets.txt")
    |> Enum.take_random(1)
    |> List.first
    |> String.trim
    |> String.downcase
  end

  def read_valid_words do
    secrets = read_file_as_list("secrets.txt")
    words = read_file_as_list("words.txt")
    secrets ++ words
  end

end
