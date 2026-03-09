# frozen_string_literal: true

# The Magical Forest of Algora - Ruby Solution

def is_magical?(sequence)
  sequence == sequence.reverse
end

def find_magical_trees(forest)
  forest.each_with_index.select { |tree, _| is_magical?(tree) }.map(&:last)
end

forest = %w[level radar civic refer rotator repaper]
puts find_magical_trees(forest).inspect
