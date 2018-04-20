
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    p @queue
  end
end

# nonsense below...
dmv_line = Queue.new
i = 1
until i > 50
  if rand(19) > 13
    dmv_line.enqueue("sucker # #{i}")
    dmv_line.show

    i += 1
  end

  dmv_line.enqueue("sucker # #{i}")
  dmv_line.show

  if rand(27) > 20
    dmv_line.dequeue
    dmv_line.show
  end

  dmv_line.dequeue
  dmv_line.show

  sleep(0.2)
  i += 1
end
