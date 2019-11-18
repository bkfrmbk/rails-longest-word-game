require 'open-uri'
require 'json'
require 'time'

class PagesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    # raise
    @letter_array = params[:letter_array].split(' ')
    @input = params[:input].upcase
    @result = results(@input, @letter_array)
    raise
  end

  private

  def letters?(input, letter_array)
    results = input.split('').all? do |letter|
      if letter_array.include?(letter.upcase)
        letter_array.delete_at(input.index(letter.upcase))
      end
    end
    results
  end

  def word?(input)
    data = open("https://wagon-dictionary.herokuapp.com/#{input}").read
    user = JSON.parse(data)
    user['found']
  end

  def results(input, letter_array)
    score = 0
    if word?(input) && letters?(input, letter_array)
      results = 'Great Job!'
      score +=
    elsif !letters?(input, letter_array)
      results = 'Not in the grid!'
    elsif !word?(input)
      results = 'Not an english word'
    end
    results
  end
end
