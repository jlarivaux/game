require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  #Part 1

  def self.random_word
    DICTIONARY.sample
  end


  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { |ele| "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end


  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    letters = @secret_word.split("")

    indexes = []
    letters.each.with_index do |ele,i|
      if char == ele
        indexes << i
      end
    end
    indexes
  end


  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end


  #Part 2


  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      idxs = self.get_matching_indices(char)
      if idxs == []
        @remaining_incorrect_guesses -= 1
        attempted_chars << char
        return true
      else
        self.fill_indices(char,idxs)
        attempted_chars << char
        return true
      end
    end
  end

  
  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp
    value = self.try_guess(char)
  end

  
  def win?
    if @secret_word == @guess_word.join("")
      puts "WIN"
      return true
    else
      return false
    end
  end


  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    elsif @remaining_incorrect_guesses > 0
      return false
    end
  end


  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end

  end


end
