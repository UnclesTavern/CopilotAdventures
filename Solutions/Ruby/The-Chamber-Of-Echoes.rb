# The Chamber of Echoes
# Adventure: The Chamber of Echoes
#
# Predicts the next number in a sequence by computing the constant difference
# between consecutive terms, then adding it to the last term.
# The full sequence (including the predicted value) is stored in memories.

echoes  = [3, 6, 9, 12]
memories = []

# Predict the next value in the sequence and store the extended sequence
def predict_next(echoes, memories)
  difference = echoes[1] - echoes[0]
  next_value = echoes.last + difference
  memories.concat(echoes + [next_value])
  next_value
end

puts predict_next(echoes, memories)
# => 15
