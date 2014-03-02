#!/usr/bin/env ruby
# encoding: UTF-8

lines = File.readlines("./source/Violation.txt")

# remove windows-1252 characters
lines.map! do |line|
  line.force_encoding("windows-1252").encode("utf-8")
end

# remove html
lines.map! do |line|
  match = line.match /(.*)<a.*>(.*)<\/a>(.*)/i
  new_line = match ? "#{match[1]}#{match[2]}#{match[3]}" : line
end

# strip windows line breaks for unix type
lines.map! do |line|
  line.strip
end

# remove smart quotes and apostrophe
lines.map! do |line|
  line.gsub("”", "&quot;").gsub("“", "&quot;").gsub("’", "'").gsub("\"\"\"", "\"\"").gsub("\"\"", "\"&quot;")
end

# smoking permitted message flub
lines.map! do |line|
  line.gsub("'Smoking Permitted&quot;", "&quot;Smoking Permitted&quot;").gsub("\"\"Smoking Permitted\"", "\"&quot;Smoking Permitted&quot;")
end

# fix existing quoted strings
lines.map! do |line|
  line.gsub!("&quot;Smoking Permitted\"", "&quot;Smoking Permitted&quot;")
  line.gsub!("\"Smoking Permitted\"", "&quot;Smoking Permitted&quot;")
  line.gsub!("\"No Smoking\"", "&quot;No Smoking&quot;")
  line.gsub!("&quot;Choking first aid\"", "&quot;Choking first aid&quot;")
  line.gsub!("\"Alcohol and Pregnancy\"", "&quot;Alcohol and Pregancy&quot;")
  line.gsub!("\"Wash hands\"", "&quot;Wash hands&quot;")
  line.gsub("&quot;Wash Hands\"", "&quot;Wash hands&quot;")
end

File.open('cleaned/Violation.csv', 'w') do |f|
  f.write lines.join("\n")
end

