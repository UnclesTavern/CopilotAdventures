# The Scrolls of Eldoria
# Adventure: Intermediate — regex-based data extraction
#
# Copilot prompt used: "Write Ruby code that reads a text file and extracts all
# secrets wrapped in {* ... *} markers using a regular expression."

# Read the scrolls from the local Data directory (relative to repo root).
# Adjust the path if running from a different working directory.
scroll_path = File.expand_path("../../Data/scrolls.txt", __dir__)

def decipher_scroll(scroll_path)
  scroll_text = File.read(scroll_path)
  # Extract content between {* and *} markers
  secrets = scroll_text.scan(/\{\*(.*?)\*\}/).flatten
  secrets
end

secrets = decipher_scroll(scroll_path)
secrets.each { |secret| puts secret }
