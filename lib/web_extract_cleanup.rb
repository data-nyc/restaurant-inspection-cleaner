#!/usr/bin/env ruby
# encoding: UTF-8

lines = File.readlines("./source/WebExtract.txt")

lines.map! do |line|
  # remove windows-1252 characters
  line.force_encoding("windows-1252").encode!("utf-8")

  # strip windows line breaks for unix type
  line.strip!

  begin
    # remove smart quotes and apostrophe
    line.gsub!("”", "&quot;")
    line.gsub!("“", "&quot;")
    line.gsub!("’", "'")
    line.gsub!("Fontana\"s", "Fontana's")
  rescue
    binding.pry
  end

  # correct ampersands
  line.gsub("&", "&amp;")
end

File.open('cleaned/WebExtract.csv', 'w') do |f|
  f.write lines.join("\n")
end

