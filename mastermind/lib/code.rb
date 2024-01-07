require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end


  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Not valid pegs"
    end
  end


  def self.random(length)
    randon_pegs = []
    length.times { randon_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(randon_pegs)
  end


  def self.from_string(string)
    Code.new(string.split(""))
  end


  def [](index)
    @pegs[index]
  end


  def length
    @pegs.length
  end
  

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index { |char, i| count += 1 if guess[i] == @pegs[i] }
    count
  end






  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end






  # def num_near_matches(guess)
  #   count = 0
  #   (0...guess.length).each do |i|
  #     if guess[i] != @pegs[i] && @pegs.include?(guess[i])
  #       count += 1
  #     end
  #   end
  #   count
  # end

  # def num_near_matches(guess_code)
  #   count = 0

  #   (0...guess_code.length).each do |i|
  #     if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
  #       count += 1
  #     end
  #   end

  #   count
  # end


  # def num_near_matches(guess_code)
  #   count = 0

  #   (0...guess_code.length).each do |i|
  #     if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
  #       count += 1
  #     end
  #   end
  #   count
  # end


  def ==(other_code)
    @pegs == other_code.pegs
  end
end
