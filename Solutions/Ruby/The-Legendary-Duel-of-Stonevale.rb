# The Legendary Duel of Stonevale
# Adventure: The Legendary Duel of Stonevale (Intermediate)
#
# Two players duel across multiple rounds of rock-paper-scissors.
# Winner of each round earns points equal to the point value of their move.

# Points awarded to the winner of each round
POINTS = { "rock" => 1, "paper" => 2, "scissors" => 3 }.freeze

# What each move beats
WINNING_MOVES = { "rock" => "scissors", "scissors" => "paper", "paper" => "rock" }.freeze

player1_moves = ["scissors", "paper", "scissors", "rock",     "rock"]
player2_moves = ["rock",     "rock",  "paper",    "scissors", "paper"]

player1_score = 0
player2_score = 0

player1_moves.zip(player2_moves).each do |move1, move2|
  next if move1 == move2  # draw — no points awarded

  if WINNING_MOVES[move1] == move2
    player1_score += POINTS[move1]
  else
    player2_score += POINTS[move2]
  end
end

puts "Player 1 Score: #{player1_score}"
puts "Player 2 Score: #{player2_score}"

if player1_score > player2_score
  puts "Player 1 wins!"
elsif player2_score > player1_score
  puts "Player 2 wins!"
else
  puts "It's a draw!"
end
# Player 1 Score: 6
# Player 2 Score: 3
# Player 1 wins!
