def calculate_time_difference(clock_times, grand_clock_time)
  grand_minutes = to_minutes(grand_clock_time)
  
  clock_times.each do |clock_name, time_str|
    clock_minutes = to_minutes(time_str)
    difference = clock_minutes - grand_minutes
    puts "#{clock_name}: #{difference} minutes"
  end
end

def to_minutes(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  hours * 60 + minutes
end

# Fantasy-themed setup matching the adventure
clock_tower_times = {
  "Sunstone Clock" => "08:15",
  "Shadow Dial" => "07:45",
  "Azure Pendulum" => "08:00"
}
grand_chronos_time = "08:00"

puts "The Clockwork Town of Tempora: Time Synchronization"
puts "--------------------------------------------------"
calculate_time_difference(clock_tower_times, grand_chronos_time)
