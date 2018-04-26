class BiggestFish
  def self.sluggish(fish_array)
    longest_fish = ""
    array_index = 0
    fish_array.each do |current_fish|
      fish_array.each_with_index do |checked_fish, idx|
        if checked_fish.length > current_fish.length && checked_fish.length > longest_fish.length
          longest_fish = checked_fish
          array_index = idx
        end
      end
    end
    array_index
  end

  def self.dominant(fish_array)
    return fish_array if fish_array.length <= 1

    middle = fish_array.length / 2
    sorted_left = dominant(fish_array.take(middle))
    sorted_right = dominant(fish_array.drop(middle))
    merged_result = merge(sorted_left, sorted_right)
  end

  def self.merge(left, right)
    merged = []

    until left.empty? || right.empty?
      merged << ((left.first.length < right.first.length) ? left.shift : right.shift)
    end

    merged + left + right
  end

  def self.clever(fish_array)
    longest_fish = ""
    fish_array.each do |fish|
      longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
  end

  def self.benchmark
    fish_array = []
    30000.times do |i|
      fish_array << "fish" + "h" * (i + 1)
    end
    fish_array.shuffle!

    start_time = Time.now
    p result1 = sluggish(fish_array)
    end_time = Time.now - start_time
    puts "Sluggish O took #{end_time} to run."

    start_time = Time.now
    result2 = dominant(fish_array).last
    p fish_array.index(result2)
    end_time = Time.now - start_time
    puts "Dominant O took #{end_time} to run."

    start_time = Time.now
    result3 = clever(fish_array)
    p fish_array.index(result3)
    end_time = Time.now - start_time
    puts "Clever O took #{end_time} to run."
    "fin"
  end
end

BiggestFish.benchmark
