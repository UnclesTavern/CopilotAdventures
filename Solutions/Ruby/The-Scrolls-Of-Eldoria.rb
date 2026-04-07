# The Scrolls of Eldoria
# Adventure: The Scrolls of Eldoria (Intermediate)
#
# Reads the local scrolls file and extracts secrets wrapped in {* ... *} markers.

scroll_path = File.join(__dir__, "..", "..", "Data", "scrolls.txt")
scroll_content = File.read(scroll_path)

# Extract all secrets enclosed in {* ... *}
secrets = scroll_content.scan(/\{\*(.*?)\*\}/).flatten

secrets.each { |secret| puts secret }
# The first secret is the key to the first door.
# The second secret lies beneath the Eldorian tree.
