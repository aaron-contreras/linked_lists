# frozen_string_literal: true

require_relative './node.rb'
# Represents a Linked list data structure
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new value
    if head.nil?
      self.head = new_node
    elsif tail.nil?
      head.next_node = new_node
      self.tail = new_node
    else
      tail.next_node = new_node
      self.tail = tail.next_node
    end
  end

  def prepend(value)
    if head.nil?
      self.head = Node.new(value)
      head.next_node = tail
    else
      self.head = Node.new(value, head)
    end
  end

  def size
    return 0 if head.nil?

    current_node = head
    node_count = 1
    until current_node.next_node.nil?
      node_count += 1
      current_node = current_node.next_node
    end

    node_count
  end

  def at(index)
    return if head.nil? || index.negative?

    current_node = head
    until index.zero?
      break if current_node.nil?

      current_node = current_node.next_node
      index -= 1
    end

    current_node
  end

  def pop
    return if head.nil?
    return self.head = nil if head.next_node.nil?

    current_node = head

    current_node = current_node.next_node until current_node.next_node == tail

    current_node.next_node = nil
    self.tail = current_node
  end

  def contains?(value)
    current_node = head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = head
    index = 0

    loop do
      return if current_node.nil?
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
  end

  def insert_at(value, index)
    return if index.negative?

    if index.zero?
      @head = Node.new(value, @head)
    else
      previous_node = find_node_before_index index
      return if previous_node.nil?

      new_node = Node.new(value, previous_node.next_node)
      previous_node.next_node = new_node
      self.tail = new_node if previous_node == tail
    end
  end

  def remove_at(index)
    return if index.negative?
    return self.head = head.next_node if index.zero?

    previous_node = find_node_before_index(index)
    return if previous_node.nil?

    node_to_remove = previous_node.next_node
    previous_node.next_node = node_to_remove.next_node
    self.tail = previous_node if node_to_remove == tail

    node_to_remove
  end

  private

  def find_node_before_index(index)
    previous_node = @head
    current_nodes_index = 1

    until current_nodes_index == index
      previous_node = previous_node.next_node
      return if previous_node.next_node.nil?

      current_nodes_index += 1
    end

    previous_node
  end

  def to_s
    stringified = ''
    current_node = head
    loop do
      return stringified += 'nil' if current_node.nil?

      stringified += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
  end
end
