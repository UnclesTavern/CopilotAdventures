def simulate_sacred_dance(lox_moves, faelis_moves)
  forest_state = "Peaceful"
  
  puts "The Magical Forest of Algora: Sacred Ritual Dance"
  puts "--------------------------------------------------"
  
  lox_moves.each_with_index do |lox_move, i|
    faelis_move = faelis_moves[i]
    effect = determine_magical_effect(lox_move, faelis_move)
    
    # Update forest state based on effect
    forest_state = update_forest_state(forest_state, effect)
    
    puts "Sequence #{i + 1}: Lox does #{lox_move}, Faelis does #{faelis_move} -> #{effect}"
    puts "Current Forest State: #{forest_state}"
    puts "---"
  end
  
  puts "Final Forest State: #{forest_state}"
end

def determine_magical_effect(move1, move2)
  case [move1, move2]
  when ["Twirl", "Twirl"]
    "Fireflies light up the forest"
  when ["Leap", "Spin"], ["Spin", "Leap"]
    "Gentle rain starts falling"
  when ["Spin", "Spin"]
    "A rainbow appears in the sky"
  when ["Twirl", "Spin"]
    "Flowers bloom instantly"
  when ["Leap", "Leap"]
    "The ground trembles slightly"
  else
    "Mystical energy hums through the trees"
  end
end

def update_forest_state(current_state, effect)
  if effect.include?("rainbow") || effect.include?("Flowers") || effect.include?("Fireflies")
    "Vibrant and Balanced"
  elsif effect.include?("rain")
    "Refreshing and Lush"
  elsif effect.include?("trembles")
    "Energetic and Wild"
  else
    current_state
  end
end

# Moves specified in the specification
lox_dance_sequence = ["Twirl", "Leap", "Spin", "Twirl", "Leap"]
faelis_dance_sequence = ["Spin", "Twirl", "Leap", "Leap", "Spin"]

simulate_sacred_dance(lox_dance_sequence, faelis_dance_sequence)
