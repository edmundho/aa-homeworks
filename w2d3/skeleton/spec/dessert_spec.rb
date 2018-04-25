require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:klondike) { Dessert.new("klondike", 9, chef)}
  let(:chef) { double("chef", name: "Jet") }

  describe "#initialize" do
    it "sets a type" do
      expect(klondike.type).to eq("klondike")
    end

    it "sets a quantity" do
      expect(klondike.quantity).to eq(9)
    end

    it "starts ingredients as an empty array" do
      expect(klondike.ingredients.class).to be(Array)
      expect(klondike.ingredients.length).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("klondike", "a lot", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(klondike.ingredients).to_not include("vanilla ice cream")
      klondike.add_ingredient("vanilla ice cream")
      expect(klondike.ingredients).to include("vanilla ice cream")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(klondike.ingredients).to receive(:shuffle!)
      klondike.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      klondike.eat(6)
      expect(klondike.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { klondike.eat(10) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jet the Great Baker")
      expect(klondike.serve).to eq("Chef Jet the Great Baker has made 9 klondikes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(klondike)
      klondike.make_more
    end
  end
end
