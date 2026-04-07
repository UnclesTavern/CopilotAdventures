# The Magical Forest of Algora
# Adventure: The Magical Forest of Algora (Beginner)
#
# Lox and Drako perform a dance; each pair of simultaneous moves produces
# a specific magical effect on the forest.

lox_moves   = ["Twirl", "Leap", "Spin", "Twirl", "Leap"]
drako_moves = ["Spin",  "Twirl", "Leap", "Leap",  "Spin"]

# Lookup table: move combination => forest effect
EFFECTS = {
  "TwirlTwirl" => "Fireflies light up the forest.",
  "LeapLeap"   => "The forest grows taller.",
  "SpinSpin"   => "The forest shrinks.",
  "TwirlLeap"  => "The forest becomes more dense.",
  "LeapSpin"   => "Gentle rain starts falling.",
  "SpinLeap"   => "A rainbow appears in the sky.",
  "TwirlSpin"  => "The forest becomes less dense.",
  "LeapTwirl"  => "The forest becomes more vibrant."
}.freeze

def dance_effect(lox_move, drako_move)
  EFFECTS.fetch("#{lox_move}#{drako_move}", "A mysterious effect takes place.")
end

def simulate_dance(lox_moves, drako_moves)
  lox_moves.zip(drako_moves).map { |l, d| dance_effect(l, d) }
end

simulate_dance(lox_moves, drako_moves).each { |effect| puts effect }
# The forest becomes less dense.
# The forest becomes more vibrant.
# A rainbow appears in the sky.
# The forest becomes more dense.
# Gentle rain starts falling.
