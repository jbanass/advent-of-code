require 'pry'

class Parser

  def self.split_on_newline(file_path)
    strip_lines(read_file(file_path).split("\n"))
  end

  def self.split_on_consecutive_newlines(file_path)
    read_file(file_path).split("\n\n").map { |line| strip_lines(line.split("\n")) }
  end

  def self.read_file(file_path)
    File.open(file_path).read
  end

  def self.strip_lines(lines)
    lines.map { |line| line.strip }
  end
end
