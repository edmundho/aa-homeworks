require 'lrucache'

RSpec.describe LRUCache do
  subject(:lru) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes an empty array" do
      expect(lru.cache.class).to be(Array)
      expect(lru.count).to eq(0)
    end

    it "initializes with a size" do
      expect(lru.size).to eq(4)
    end
  end

  describe "#count" do
    it "returns the number of items in the cache" do
      lru.add("faye")
      lru.add("Spike")
      lru.add("Ein")

      expect(lru.count).to eq(3)
    end
  end

  describe "#add" do
    before(:each) do
      lru.add(2)
      lru.add("Spike")
      lru.add("faye")
      lru.add("Spike")
      lru.add("Ein")
    end

    it "adds the new item to the cache" do
      lru.add("jet black")
      expect(lru.cache).to include("jet black")
    end

    it "makes the item the most recently used if already in cache" do
      expect(lru.cache.last).to eq("Ein")
    end

    it "drops the least recently used item to add a new item if the cache is at capacity" do
      lru.add("Ed")
      expect(lru.cache).not_to include(2)
    end

  end

  describe "#show" do
    it "returns cache" do
      lru.add("Ed")
      lru.add("jet black")
      lru.add("SWORDFISH")
      lru.add("vicious")
      lru.add("Ein")
      lru.add("SWORDFISH")
      expect(lru.show).to eq(["jet black", "vicious", "Ein", "SWORDFISH"])
    end
  end
end
