require 'open-uri'
require 'json'
class GamesController < ApplicationController
  $LETTERS = ""
  def new
    @letters = "QWERTYUIOPLKJHGFDSAZXCVBNM".split("").shuffle[0..9]
    $LETTERS = @letters

  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/"
    flag = true
    @word = params["inputval"]
    url += @word
    string = $LETTERS
    response = URI.parse(url).read
    puts found = JSON.parse(response)["found"]
    flag = false unless found == true
    @word.split("").each do |letter|
      flag = false unless string.include? letter
    end
    @word = "" unless flag


    end
end
