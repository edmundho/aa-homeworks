
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end
end

new_stack = Stack.new
9.times { |i| new_stack.add(i) }
new_stack.show
first_out = new_stack.remove
p first_out
new_stack.show

cafeteria_goers = (0..6).each do |tray|
  puts "Cafeteria goer takes tray # #{new_stack.show.last} off the #{new_stack.remove} tray stack."
end

new_stack.show
