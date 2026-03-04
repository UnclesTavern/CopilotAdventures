# The Clockwork Town of Tempora
# Adventure: Beginner — time arithmetic
#
# Copilot prompt used: "Write a Ruby method that calculates the minute difference
# between two time strings in HH:MM format, then use it to synchronize an array
# of clock times with a grand clock."

# Calculates the difference in minutes between a clock time and the grand clock.
def time_difference(clock_time, grand_clock_time)
  clock_hour, clock_minute = clock_time.split(":").map(&:to_i)
  grand_hour, grand_minute = grand_clock_time.split(":").map(&:to_i)
  (clock_hour - grand_hour) * 60 + (clock_minute - grand_minute)
end

# Returns the minute offset for each clock relative to the grand clock.
def synchronize_clocks(clock_times, grand_clock_time)
  clock_times.map { |t| time_difference(t, grand_clock_time) }
end

clock_times = ["14:45", "15:05", "15:00", "14:40"]
grand_clock_time = "15:00"

offsets = synchronize_clocks(clock_times, grand_clock_time)
puts offsets.inspect  # => [-15, 5, 0, -20]
