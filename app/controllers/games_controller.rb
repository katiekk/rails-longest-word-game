require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @grid = params[:letters].split(' ')
    @result = parse(@word)['found']
    @is_valid = valid?(@word, @grid)
    session[:score] += @word.length**2 if @result && @is_valid
  end

  private

  def parse(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    JSON.parse(URI.open(url).read)
  end

  def valid?(word, grid)
    word.chars.select { |char| word.chars.count(char) > grid.count(char.upcase) }.empty?
  end
end
