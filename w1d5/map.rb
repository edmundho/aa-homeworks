
class Map
  attr_writer :map

  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.none? { |pair| pair[0] == key }
      @map << [key, value]
    else
      lookup(key)[-1] = value
    end
  end


  def lookup(key)
    index = nil
    @map.each_with_index { |pair, i| index = i if pair[0] == key }
    index.nil? ? nil : @map[index]
  end

  def get(key)
    lookup(key).nil? ? "No key in map" : lookup(key)[-1]
  end

  def remove(key)
    @map.delete(lookup(key))
  end

  def show
    p @map
  end
end

test_map = Map.new
7.times do
  test_map.assign(rand(99), rand(99))
end

p test_map.show.length
