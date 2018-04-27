class LRUCache
  attr_reader :size, :cache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if count < size
      @cache << el
    elsif @cache.include?(el)
      make_most_recent(el)
    elsif count == size
      drop_lru
      @cache << el
    end
  end

  def show
    p @cache
  end

  private

  def make_most_recent(el)
    @cache << @cache.delete(el)
  end

  def drop_lru
    @cache.shift
  end
end
