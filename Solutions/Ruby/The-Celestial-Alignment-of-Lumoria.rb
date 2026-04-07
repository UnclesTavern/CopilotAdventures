# The Celestial Alignment of Lumoria
# Adventure: The Celestial Alignment of Lumoria (Intermediate)
#
# Calculates the light intensity each planet receives during a rare alignment.
# A closer, larger planet casts a shadow on planets further from the sun.

planets = [
  { name: "Mercuria", distance: 0.4, size: 4879  },
  { name: "Earthia",  distance: 1.0, size: 12742 },
  { name: "Venusia",  distance: 0.7, size: 12104 },
  { name: "Marsia",   distance: 1.5, size: 6779  }
]

# Sort planets by distance from the Lumorian Sun (closest first)
sorted_planets = planets.sort_by { |p| p[:distance] }

# Count how many closer planets are larger than the planet at index i
def shadow_count(planets, index)
  planets[0...index].count { |p| p[:size] > planets[index][:size] }
end

# Determine light intensity based on shadow count and position
def light_intensity(index, shadows)
  return "Full"                    if index == 0
  return "None (Multiple Shadows)" if shadows > 1
  return "None"                    if shadows == 1
  "Partial"
end

# Calculate and display light intensity for each planet
sorted_planets.each_with_index do |planet, i|
  shadows = shadow_count(sorted_planets, i)
  intensity = light_intensity(i, shadows)
  puts "#{planet[:name]}: #{intensity}"
end
# Mercuria: Full
# Venusia: Partial
# Earthia: Partial
# Marsia: Partial
