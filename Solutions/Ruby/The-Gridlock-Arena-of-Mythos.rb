# The Gridlock Arena of Mythos
# Adventure: The Gridlock Arena of Mythos (Advanced)
#
# Simulates a 5x5 grid battle between mystical creatures.
# Each round all creatures move simultaneously; creatures sharing a cell battle.
# The highest-power creature wins and earns points equal to the sum of defeated
# creatures' power values. Eliminated creatures leave the arena.

GRID_SIZE = 5
EMPTY     = "⬜️"
BATTLE    = "🤺"

DIRECTIONS = {
  "UP"    => [-1,  0],
  "DOWN"  => [ 1,  0],
  "LEFT"  => [ 0, -1],
  "RIGHT" => [ 0,  1]
}.freeze

creatures_data = [
  { name: "Dragon", start: [0, 0], moves: %w[RIGHT DOWN RIGHT], power: 7, icon: "🐉" },
  { name: "Goblin", start: [0, 2], moves: %w[LEFT  DOWN LEFT ], power: 3, icon: "👺" },
  { name: "Ogre",   start: [2, 0], moves: %w[UP    RIGHT DOWN], power: 5, icon: "👹" },
  { name: "Troll",  start: [2, 2], moves: %w[UP    LEFT  UP  ], power: 4, icon: "👿" },
  { name: "Wizard", start: [4, 1], moves: %w[UP    UP    LEFT], power: 6, icon: "🧙" }
]

# Deep-copy creature hashes so we can mutate positions during simulation
def copy_creature(c)
  { name: c[:name], pos: c[:start].dup, moves: c[:moves].dup,
    power: c[:power], icon: c[:icon] }
end

def new_grid
  Array.new(GRID_SIZE) { Array.new(GRID_SIZE, nil) }
end

def clamp_position(row, col)
  [row.clamp(0, GRID_SIZE - 1), col.clamp(0, GRID_SIZE - 1)]
end

def calculate_new_position(pos, direction)
  dr, dc = DIRECTIONS[direction]
  clamp_position(pos[0] + dr, pos[1] + dc)
end

# Resolve a battle among creatures sharing a cell; returns names of the defeated
def process_battle(group, scores)
  max_power = group.map { |c| c[:power] }.max
  winners   = group.select { |c| c[:power] == max_power }
  defeated  = group.reject { |c| c[:power] == max_power }

  if winners.size == 1
    # Single winner earns sum of all defeated creatures' power values
    scores[winners[0][:name]] += defeated.sum { |c| c[:power] }
  end
  # If tie, everyone in the cell is eliminated (defeated = all; handled below)
  if winners.size > 1
    return group.map { |c| c[:name] }
  end
  defeated.map { |c| c[:name] }
end

def render_grid(label, grid, scores, all_creatures)
  puts label
  grid.each { |row| puts row.map { |cell| cell || EMPTY }.join(" ") }

  score_str = all_creatures.map { |c| "'#{c[:icon]} #{c[:name]}': #{scores[c[:name]]}" }.join(", ")
  puts "Scores: { #{score_str} }"
  puts "-----"
end

def simulate_battle(creatures_data)
  active = creatures_data.map { |c| copy_creature(c) }
  scores = creatures_data.each_with_object({}) { |c, h| h[c[:name]] = 0 }

  # Build and display initial board
  grid = new_grid
  active.each { |c| grid[c[:pos][0]][c[:pos][1]] = c[:icon] }
  render_grid("Initial Board", grid, scores, creatures_data)

  max_moves = creatures_data.first[:moves].length

  max_moves.times do |move_index|
    grid = new_grid

    # Calculate all new positions
    new_positions = active.map do |c|
      new_pos = calculate_new_position(c[:pos], c[:moves][move_index])
      { creature: c, new_pos: new_pos }
    end

    # Group by destination cell
    groups = new_positions.group_by { |np| np[:new_pos] }

    defeated_names = []

    groups.each do |pos, entries|
      row, col = pos
      if entries.size > 1
        grid[row][col] = BATTLE
        defeated_names.concat(process_battle(entries.map { |e| e[:creature] }, scores))
      else
        grid[row][col] = entries[0][:creature][:icon]
      end
    end

    # Update positions for surviving creatures, remove defeated
    active = active.reject { |c| defeated_names.include?(c[:name]) }
    active.each do |c|
      np_entry = new_positions.find { |np| np[:creature][:name] == c[:name] }
      c[:pos] = np_entry[:new_pos] if np_entry
    end

    render_grid("Move #{move_index + 1}", grid, scores, creatures_data)

    break if active.empty?
  end

  scores
end

final_scores = simulate_battle(creatures_data)

puts "\n🏆 FINAL BATTLE RESULTS 🏆"
creatures_data.each do |c|
  puts "'#{c[:icon]} #{c[:name]}': #{final_scores[c[:name]]}"
end
