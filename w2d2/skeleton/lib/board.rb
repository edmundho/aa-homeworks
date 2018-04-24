require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 13
      raise Exception.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    last_cup = nil
    case current_player_name
    when @player1
      valid_cups = @cups[0..12]
    when @player2
      valid_cups = @cups[0..5] + @cups[7..13]
    end
    num_stones = @cups[start_pos].length
    num_stones.times do |i|
      subsequent_cup = start_pos + (i + 1)
      valid_cups[subsequent_cup % 13] << @cups[start_pos].pop
      last_cup = subsequent_cup % 13
    end

    render

    ending_cup_idx = last_cup
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 0
      return :prompt
    elsif @cups[ending_cup_idx - 1].length == 1
      return :switch
    elsif !@cups[ending_cup_idx].empty?
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @player1 : @player2
  end
end
