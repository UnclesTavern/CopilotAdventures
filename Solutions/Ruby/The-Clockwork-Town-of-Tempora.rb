# The Clockwork Town of Tempora
# Adventure: The Clockwork Town of Tempora (Beginner)
#
# Calculates the time difference (in minutes) between each town clock
# and the grand clock. Negative means the clock is behind; positive means ahead.

# Calculate the difference in minutes between two "HH:MM" time strings
def time_difference(clock_time, grand_clock_time)
  clock_hour, clock_minute = clock_time.split(":").map(&:to_i)
  grand_hour, grand_minute = grand_clock_time.split(":").map(&:to_i)
  (clock_hour - grand_hour) * 60 + (clock_minute - grand_minute)
end

# Return an array of minute offsets for each clock relative to the grand clock
def synchronize_clocks(clock_times, grand_clock_time)
  clock_times.map { |t| time_difference(t, grand_clock_time) }
end

clock_times      = ["14:45", "15:05", "15:00", "14:40"]
grand_clock_time = "15:00"

puts synchronize_clocks(clock_times, grand_clock_time).inspect
# => [-15, 5, 0, -20]
