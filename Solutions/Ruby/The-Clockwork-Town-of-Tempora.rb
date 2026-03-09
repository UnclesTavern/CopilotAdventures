# frozen_string_literal: true

# The Clockwork Town of Tempora - Ruby Solution

def time_difference(clock_time, grand_clock_time)
  clock_hour, clock_minute = clock_time.split(':').map(&:to_i)
  grand_clock_hour, grand_clock_minute = grand_clock_time.split(':').map(&:to_i)
  
  (clock_hour - grand_clock_hour) * 60 + (clock_minute - grand_clock_minute)
end

def synchronize_clocks(clock_times, grand_clock_time)
  clock_times.map { |clock_time| time_difference(clock_time, grand_clock_time) }
end

clock_times = ["14:45", "15:05", "15:00", "14:40"]
grand_clock_time = "15:00"
puts synchronize_clocks(clock_times, grand_clock_time).inspect
