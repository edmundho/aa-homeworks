class DancingOctopus
  def self.slow_dance(given_dir, tiles_array)
    must_move = nil
    tiles_array.each_with_index do |tile, index|
      must_move = index if tile == given_dir
    end

    puts must_move
  end

  def self.fast_dance(tile, tiles_adt)
    puts must_move = tiles_adt[tile.to_sym]
  end

  def self.perform_all
    tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

    tiles_adt = { up: 0, "right-up": 1, "right": 2, "right-down": 3, "down": 4, "left-down": 5, "left": 6, "left-up": 7 }

    slow_dance("up", tiles_array)
    slow_dance("right-down", tiles_array)
    fast_dance("up", tiles_adt)
    fast_dance("right-down", tiles_adt)
  end
end

DancingOctopus.perform_all
