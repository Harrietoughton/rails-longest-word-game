require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }.join("")
  end

  def score
    @word = params[:word].upcase
    @array = params[:array]
    if @word.chars.all? { |letter| @word.count(letter) <= @array.count(letter) } == true
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    @result = JSON.parse(user_serialized)
      @result["found"] == true ? @phrase = "your word is in the dictionary and the grid!" : @phrase = "your word is not in the dictionary!"
    else
      return @phrase = "your letters are not in the grid!"
    end

  end
end

