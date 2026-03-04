# The Magical Forest of Algora
# Adventure: Beginner — pattern matching / dance effects
#
# Copilot prompt used: "Write Ruby code that maps pairs of dance moves from two
# characters (Lox and Drako) to forest effects using a hash lookup."

lox_moves = ["Twirl", "Leap", "Spin", "Twirl", "Leap"]
drako_moves = ["Spin", "Twirl", "Leap", "Leap", "Spin"]

# Each combination of moves produces a unique magical effect in the forest.
effects = {
  "TwirlTwirl" => "Fireflies light up the forest.",
  "LeapLeap"   => "The forest grows taller.",
  "SpinSpin"   => "The forest shrinks.",
  "TwirlLeap"  => "The forest becomes more dense.",
  "LeapSpin"   => "Gentle rain starts falling.",
  "SpinLeap"   => "A rainbow appears in the sky.",
  "TwirlSpin"  => "The forest becomes less dense.",
  "LeapTwirl"  => "The forest becomes more vibrant."
}

def dance_effect(lox_move, drako_move, effects)
  effects.fetch("#{lox_move}#{drako_move}", "A mysterious effect takes place.")
end

def simulate_dance(lox_moves, drako_moves, effects)
  lox_moves.zip(drako_moves).map { |lox, drako| dance_effect(lox, drako, effects) }
end

results = simulate_dance(lox_moves, drako_moves, effects)
results.each { |effect| puts effect }
