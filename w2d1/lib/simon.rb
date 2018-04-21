class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    system('clear')
    puts "Get ready..."
    sleep 1
    system('clear')
    puts "Here's the sequence!"
    sleep 0.5
    seq.each do |color|
      system('clear')
      puts color
      sleep 1
      system('clear')
      puts "..."
      sleep 0.5
    end
  end

  def require_sequence
    puts "Repeat the sequence! Type below:"
    players_sequence = []
    until @game_over || players_sequence.length == sequence_length
      i = players_sequence.length
      get_color = gets.chomp
      if get_color != seq[i]
        @game_over = true
        break
      else
        players_sequence << get_color
        puts "You entered '#{get_color}'... Was there something next?"
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! Get ready for the next sequence!"
    sleep 2
  end

  def game_over_message
    puts "\n"
    puts "Oh that was not correct. Sorry!"
    puts "You remembered a #{sequence_length - 2} color sequence."
    puts "Game over. Play again!!"
    puts "\n"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

ng = Simon.new
ng.play
